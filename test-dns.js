const dns = require('dns');

let success = 0;
let failed = 0;
let counter = 0;
const host = 'ecs.eu-de.otc.t-systems.com';

const startTime = new Date().toISOString();
const startTimestamp = Math.floor(Date.now() / 1000);

const performLookup = () => {
  dns.lookup(host, (err) => {
    if (!err) {
      success++;
    } else {
      failed++;
    }
    counter++;

    if (counter < 1000) {
      setTimeout(performLookup, 500); // 500 milliseconds delay
    } else {
      const endTime = new Date().toISOString();
      const endTimestamp = Math.floor(Date.now() / 1000);

      if (counter !== 0) {
        const successRate = ((success / counter) * 100).toFixed(2);
        const epochSeconds = endTimestamp - startTimestamp;
        console.log(`[${startTime} --- ${endTime}] Success: ${success} Failed: ${failed} Rate: ${successRate}% Epoch: ${epochSeconds}s`);
      } else {
        console.error('[ERROR] Loop did not run?');
      }
    }
  });
};

performLookup();

