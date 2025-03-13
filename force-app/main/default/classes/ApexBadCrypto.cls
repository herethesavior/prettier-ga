public with sharing class ApexBadCrypto {
    public Blob main() {
        Blob hardCodedIV = Blob.valueOf('NameOfMyDog');
        Blob hardCodedKey = Blob.valueOf('21353we45242');
        Blob secret = Blob.valueOf('Secret');

        return Crypto.encrypt('AES128', hardCodedKey, hardCodedIV, secret);
    }
}
