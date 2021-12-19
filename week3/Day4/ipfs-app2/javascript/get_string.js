// Dependencies
const IPFS = require('ipfs');
const all = require('it-all'); //enables you to download all data in one go
(async () => {
  // Initialise IPFS node
  const node = await IPFS.create();
  // Store CID in a variable
  const cid = 'QmThQfQxzwnv7uDTtHM2MfTj247PJnvhMysQM2G8GwW1tF';
  // Retrieve data from CID
  const data = Buffer.concat(await all(node.cat(cid)));
  // Print data to console
  console.log(data.toString());
})();
