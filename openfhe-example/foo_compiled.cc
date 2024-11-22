
#include "openfhe/pke/openfhe.h"

using namespace lbcrypto;
using CiphertextT = ConstCiphertext<DCRTPoly>;
using CCParamsT = CCParams<CryptoContextBGVRNS>;
using CryptoContextT = CryptoContext<DCRTPoly>;
using EvalKeyT = EvalKey<DCRTPoly>;
using PlaintextT = Plaintext;
using PrivateKeyT = PrivateKey<DCRTPoly>;
using PublicKeyT = PublicKey<DCRTPoly>;

CiphertextT foo(CryptoContextT v0, CiphertextT v1, CiphertextT v2) {
  const auto& v3 = v0->EvalMultNoRelin(v1, v1);
  const auto& v4 = v0->Relinearize(v3);
  const auto& v5 = v0->EvalMultNoRelin(v2, v2);
  const auto& v6 = v0->Relinearize(v5);
  const auto& v7 = v0->EvalSub(v4, v6);
  return v7;
}
CiphertextT foo__encrypt__arg0(CryptoContextT v8, int16_t v9, PublicKeyT v10) {
  std::vector<int16_t> v11(32, v9);
  std::vector<int64_t> v12(std::begin(v11), std::end(v11));
  const auto& v13 = v8->MakePackedPlaintext(v12);
  const auto& v14 = v8->Encrypt(v10, v13);
  return v14;
}
CiphertextT foo__encrypt__arg1(CryptoContextT v15, int16_t v16,
                               PublicKeyT v17) {
  std::vector<int16_t> v18(32, v16);
  std::vector<int64_t> v19(std::begin(v18), std::end(v18));
  const auto& v20 = v15->MakePackedPlaintext(v19);
  const auto& v21 = v15->Encrypt(v17, v20);
  return v21;
}
int16_t foo__decrypt__result0(CryptoContextT v22, CiphertextT v23,
                              PrivateKeyT v24) {
  PlaintextT v25;
  v22->Decrypt(v24, v23, &v25);
  int16_t v26 = v25->GetPackedValue()[0];
  return v26;
}
CryptoContextT foo__generate_crypto_context() {
  CCParamsT v27;
  v27.SetMultiplicativeDepth(1);
  v27.SetPlaintextModulus(4295294977);
  CryptoContextT v28 = GenCryptoContext(v27);
  v28->Enable(PKE);
  v28->Enable(KEYSWITCH);
  v28->Enable(LEVELEDSHE);
  return v28;
}
CryptoContextT foo__configure_crypto_context(CryptoContextT v29,
                                             PrivateKeyT v30) {
  v29->EvalMultKeyGen(v30);
  return v29;
}
