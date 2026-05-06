import unittest
import os
import json
from .startup import LocalMetadata

class TestLocalMetadata(unittest.TestCase):
    def setUp(self):
        self.test_file = "test_metadata.json"

    def tearDown(self):
        if os.path.exists(self.test_file):
            os.remove(self.test_file)

    def test_save_and_load(self):
        meta = LocalMetadata(XXMI_version="v7.0")
        meta.save(self.test_file)
        
        loaded = LocalMetadata.load(self.test_file)
        self.assertIsNotNone(loaded)
        self.assertEqual(loaded.XXMI_version, "v7.0")

    def test_load_non_existent(self):
        loaded = LocalMetadata.load("non_existent.json")
        self.assertIsNone(loaded)

    def test_load_missing_fields(self):
        # Create a json with no fields
        with open(self.test_file, 'w') as f:
            json.dump({}, f)
        
        loaded = LocalMetadata.load(self.test_file)
        self.assertIsNotNone(loaded)
        self.assertIsNone(loaded.XXMI_version)

    def test_load_extra_fields(self):
        # Create a json with extra fields
        with open(self.test_file, 'w') as f:
            json.dump({"XXMI_version": "v7.0", "extra": "value"}, f)
        
        loaded = LocalMetadata.load(self.test_file)
        self.assertIsNotNone(loaded)
        self.assertEqual(loaded.XXMI_version, "v7.0")
        self.assertFalse(hasattr(loaded, "extra"))

    def test_load_corrupted_json(self):
        with open(self.test_file, 'w') as f:
            f.write("not a json")
        
        loaded = LocalMetadata.load(self.test_file)
        self.assertIsNone(loaded)

if __name__ == "__main__":
    unittest.main()
