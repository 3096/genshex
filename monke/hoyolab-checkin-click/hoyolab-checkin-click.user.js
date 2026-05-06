// ==UserScript==
// @name        HoYoLAB Check-in Click
// @namespace   https://github.com/3096/genshex
// @version     0.1.0
// @description Automates daily check-in clicks on HoYoLAB.
// @author      3096
// @match       https://act.hoyolab.com/ys/event/signin-sea-v3/index.html*
// @grant       none
// ==/UserScript==

'use strict';

(function () {
  console.log('HoYoLAB Check-in Click script loaded.');

  setTimeout(() => {
    // Find the current active day indicator that has the red point inside
    const activeDayContainer = document.querySelector('div[class*="---actived-day---"]');
    if (activeDayContainer) {
      console.log('Active check-in day found. Clicking...');
      activeDayContainer.click();
    } else {
      console.log('No active check-in day found. You might be already checked in today.');
    }
  }, 3000);
})();
