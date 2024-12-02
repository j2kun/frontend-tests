module {
  func.func @foo(%arg0: !openfhe.crypto_context, %arg1: !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>, %arg2: !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16> {
    %0 = openfhe.mul_no_relin %arg0, %arg1, %arg1 : (!openfhe.crypto_context, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <dimension = 3, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
    %1 = openfhe.relin %arg0, %0 : (!openfhe.crypto_context, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <dimension = 3, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
    %2 = openfhe.mul_no_relin %arg0, %arg2, %arg2 : (!openfhe.crypto_context, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <dimension = 3, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
    %3 = openfhe.relin %arg0, %2 : (!openfhe.crypto_context, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <dimension = 3, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
    %4 = openfhe.sub %arg0, %1, %3 : (!openfhe.crypto_context, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
    return %4 : !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
  }
  func.func @foo__encrypt__arg0(%arg0: !openfhe.crypto_context, %arg1: i16, %arg2: !openfhe.public_key) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16> {
    %splat = tensor.splat %arg1 : tensor<32xi16>
    %0 = arith.extsi %splat : tensor<32xi16> to tensor<32xi64>
    %1 = openfhe.make_packed_plaintext %arg0, %0 : (!openfhe.crypto_context, tensor<32xi64>) -> !lwe.rlwe_plaintext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>, underlying_type = i16>
    %2 = openfhe.encrypt %arg0, %1, %arg2 : (!openfhe.crypto_context, !lwe.rlwe_plaintext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>, underlying_type = i16>, !openfhe.public_key) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
    return %2 : !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
  }
  func.func @foo__encrypt__arg1(%arg0: !openfhe.crypto_context, %arg1: i16, %arg2: !openfhe.public_key) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16> {
    %splat = tensor.splat %arg1 : tensor<32xi16>
    %0 = arith.extsi %splat : tensor<32xi16> to tensor<32xi64>
    %1 = openfhe.make_packed_plaintext %arg0, %0 : (!openfhe.crypto_context, tensor<32xi64>) -> !lwe.rlwe_plaintext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>, underlying_type = i16>
    %2 = openfhe.encrypt %arg0, %1, %arg2 : (!openfhe.crypto_context, !lwe.rlwe_plaintext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>, underlying_type = i16>, !openfhe.public_key) -> !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
    return %2 : !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>
  }
  func.func @foo__decrypt__result0(%arg0: !openfhe.crypto_context, %arg1: !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>, %arg2: !openfhe.private_key) -> i16 {
    %0 = openfhe.decrypt %arg0, %arg1, %arg2 : (!openfhe.crypto_context, !lwe.rlwe_ciphertext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, rlwe_params = <ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>>, underlying_type = i16>, !openfhe.private_key) -> !lwe.rlwe_plaintext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>, underlying_type = i16>
    %1 = lwe.rlwe_decode %0 {encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, ring = #polynomial.ring<coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>} : !lwe.rlwe_plaintext<encoding = #lwe.polynomial_evaluation_encoding<cleartext_start = 16, cleartext_bitwidth = 16>, ring = <coefficientType = i32, coefficientModulus = 463187969 : i32, polynomialModulus = <1 + x**32>>, underlying_type = i16> -> i16
    return %1 : i16
  }
  func.func @foo__generate_crypto_context() -> !openfhe.crypto_context {
    %0 = openfhe.gen_params  {mulDepth = 1 : i64, plainMod = 4295294977 : i64} : () -> !openfhe.cc_params
    %1 = openfhe.gen_context %0 : (!openfhe.cc_params) -> !openfhe.crypto_context
    return %1 : !openfhe.crypto_context
  }
  func.func @foo__configure_crypto_context(%arg0: !openfhe.crypto_context, %arg1: !openfhe.private_key) -> !openfhe.crypto_context {
    openfhe.gen_mulkey %arg0, %arg1 : (!openfhe.crypto_context, !openfhe.private_key) -> ()
    return %arg0 : !openfhe.crypto_context
  }
}
