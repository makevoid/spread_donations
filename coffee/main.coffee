bcore = require("bitcore")

privateKey = new bcore.PrivateKey()
publicKey = privateKey.publicKey
address = publicKey.toAddress()


$ ->
  console.log(address)
  $("#wallet").html(address.toString())


  console.log("log")
