import urllib.request
import json
import zipfile
import os
import shutil
import subprocess
from dataclasses import dataclass, asdict
from typing import Optional


@dataclass
class LocalMetadata:
    XXMI_version: Optional[str] = None

    def save(self, filepath: str):
        with open(filepath, "w") as f:
            json.dump(asdict(self), f)

    @classmethod
    def load(cls, filepath: str) -> Optional["LocalMetadata"]:
        if not os.path.exists(filepath):
            return None
        try:
            with open(filepath, "r") as f:
                data = json.load(f)
                # Filter data to only include fields present in the dataclass
                filtered_data = {
                    k: v for k, v in data.items() if k in cls.__dataclass_fields__
                }
                return cls(**filtered_data)
        except Exception:
            return None


def download_latest_XXMI():
    print("Checking for latest XXMI release...")
    api_url = "https://api.github.com/repos/SilentNightSound/GI-Model-Importer/releases/latest"

    try:
        with urllib.request.urlopen(api_url) as response:
            data = json.loads(response.read().decode())

        assets = data.get("assets", [])
        zip_asset = next(
            (
                asset
                for asset in assets
                if "3dmigoto-XXMI-for-playing-mods.zip" in asset["name"]
            ),
            None,
        )

        if not zip_asset:
            print("Could not find the XXMI zip asset in the latest release.")
            return

        download_url = zip_asset["browser_download_url"]
        zip_path = "XXMI_latest.zip"

        print(f"Downloading latest release from {download_url}...")
        urllib.request.urlretrieve(download_url, zip_path)

        print("Extracting files...")
        with zipfile.ZipFile(zip_path, "r") as zip_ref:
            temp_extract_dir = "XXMI_temp_update"
            zip_ref.extractall(temp_extract_dir)

            source_dir = os.path.join(temp_extract_dir, "3dmigoto")
            target_dir = os.environ.get("XXMI_DIR")
            if not target_dir:
                print("XXMI_DIR is not set; cannot update XXMI files.")
                return

            if not os.path.exists(target_dir):
                os.makedirs(target_dir)

            for item in os.listdir(source_dir):
                s = os.path.join(source_dir, item)
                d = os.path.join(target_dir, item)
                if item == "Mods":
                    continue
                if os.path.isdir(s):
                    if os.path.exists(d):
                        shutil.rmtree(d)
                    shutil.copytree(s, d)
                else:
                    shutil.copy2(s, d)

        os.remove(zip_path)
        shutil.rmtree(temp_extract_dir)
        print("XXMI updated successfully!")

    except Exception as e:
        print(f"An error occurred while updating XXMI: {e}")


def parse_grm_upgrades(value: str) -> list[str]:
    """Parse GRM_UPGRADES into upgrade tokens.

    Supports comma, semicolon, and newline delimiters.
    """
    if not value:
        return []

    normalized = value.replace(";", ",").replace("\n", ",")
    return [item.strip() for item in normalized.split(",") if item.strip()]


def upgrade_with_grm() -> bool:
    """Run `grm upgrade` for each item in GRM_UPGRADES.

    If an item is not yet managed by grm, fall back to `grm add <repo>`.

    Returns True if GRM flow was attempted, False otherwise.
    """
    grm_exe = shutil.which("grm")
    if not grm_exe:
        print("grm command not found; skipping GRM upgrade flow.")
        return False

    upgrades = parse_grm_upgrades(os.environ.get("GRM_UPGRADES", ""))
    if not upgrades:
        print("GRM_UPGRADES is empty; nothing to upgrade with grm.")
        return False

    print(f"Using grm at: {grm_exe}")
    for item in upgrades:
        cmd = [grm_exe, "upgrade", item]
        print(f"Running: {' '.join(cmd)}")
        try:
            subprocess.run(cmd, check=True)
        except subprocess.CalledProcessError as exc:
            print(
                f"grm upgrade failed for '{item}' with exit code {exc.returncode}; trying grm add"
            )
            try:
                add_cmd = [grm_exe, "add", item]
                print(f"Running: {' '.join(add_cmd)}")
                subprocess.run(add_cmd, check=True)
            except subprocess.CalledProcessError as add_exc:
                print(
                    f"grm add failed for '{item}' with exit code {add_exc.returncode}"
                )
            except Exception as add_exc:
                print(f"Unexpected error while running grm add for '{item}': {add_exc}")
        except Exception as exc:
            print(f"Unexpected error while running grm for '{item}': {exc}")

    return True


def main():
    if not upgrade_with_grm():
        download_latest_XXMI()


if __name__ == "__main__":
    main()
