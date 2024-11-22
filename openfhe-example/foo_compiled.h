
#include "openfhe/pke/openfhe.h"

using namespace lbcrypto;
using CiphertextT = ConstCiphertext<DCRTPoly>;
using CCParamsT = CCParams<CryptoContextBGVRNS>;
using CryptoContextT = CryptoContext<DCRTPoly>;
using EvalKeyT = EvalKey<DCRTPoly>;
using PlaintextT = Plaintext;
using PrivateKeyT = PrivateKey<DCRTPoly>;
using PublicKeyT = PublicKey<DCRTPoly>;

CiphertextT foo(CryptoContextT v0, CiphertextT v1, CiphertextT v2);
CiphertextT foo__encrypt__arg0(CryptoContextT v8, int16_t v9, PublicKeyT v10);
CiphertextT foo__encrypt__arg1(CryptoContextT v15, int16_t v16, PublicKeyT v17);
int16_t foo__decrypt__result0(CryptoContextT v22, CiphertextT v23,
                              PrivateKeyT v24);
CryptoContextT foo__generate_crypto_context();
CryptoContextT foo__configure_crypto_context(CryptoContextT v29,
                                             PrivateKeyT v30);
