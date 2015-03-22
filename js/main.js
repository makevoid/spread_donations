var address, bcore, privateKey, publicKey;

bcore = require("bitcore");

privateKey = new bcore.PrivateKey();

publicKey = privateKey.publicKey;

address = publicKey.toAddress();

$(function() {
  console.log(address);
  $("#wallet").html(address.toString());
  return console.log("log");
});
