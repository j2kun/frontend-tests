#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

#include "foo_compiled.h"

using namespace lbcrypto;
namespace py = pybind11;

// Minimal bindings required for generated functions to run.
void bind_common(py::module &m)
{
    py::class_<PublicKeyImpl<DCRTPoly>, std::shared_ptr<PublicKeyImpl<DCRTPoly>>>(m, "PublicKey")
        .def(py::init<>());
    py::class_<PrivateKeyImpl<DCRTPoly>, std::shared_ptr<PrivateKeyImpl<DCRTPoly>>>(m, "PrivateKey")
        .def(py::init<>());
    py::class_<KeyPair<DCRTPoly>>(m, "KeyPair")
        .def_readwrite("publicKey", &KeyPair<DCRTPoly>::publicKey)
        .def_readwrite("secretKey", &KeyPair<DCRTPoly>::secretKey);

    py::class_<CiphertextImpl<DCRTPoly>, std::shared_ptr<CiphertextImpl<DCRTPoly>>>(m, "Ciphertext")
        .def(py::init<>());

   py::class_<CryptoContextImpl<DCRTPoly>, std::shared_ptr<CryptoContextImpl<DCRTPoly>>>(m, "CryptoContext")
        .def(py::init<>())
        .def("KeyGen", &CryptoContextImpl<DCRTPoly>::KeyGen);
}


PYBIND11_MODULE(_heir_foo, m) {
    bind_common(m);

    m.def("foo", &foo);
    m.def("foo__encrypt__arg0", &foo__encrypt__arg0);
    m.def("foo__encrypt__arg1", &foo__encrypt__arg1);
    m.def("foo__decrypt__result0", &foo__decrypt__result0);
    m.def("foo__generate_crypto_context", &foo__generate_crypto_context);
    m.def("foo__configure_crypto_context", &foo__configure_crypto_context);
}

