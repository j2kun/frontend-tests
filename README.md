```
numba.core.compiler.Pipeline.compile_extra

bytecode.FunctionIdentity.from_function(func) -> get basic info
about the function, code, etc. ExtractByteCode

```

Pipeline start:

`b venv/lib/python3.12/site-packages/numba/core/compiler_machinery.py:351`

Nopython pipeline

```
TranslateByteCode, analyzing bytecode
FixupArgs, fix up args
IRProcessing, processing IR
WithLifting, Handle with contexts
InlineClosureLikes, inline calls to locally defined closures
RewriteSemanticConstants, rewrite semantic constants
DeadBranchPrune, dead branch pruning
GenericRewrites, nopython rewrites
RewriteDynamicRaises, rewrite dynamic raises
MakeFunctionToJitFunction, convert make_function into JIT functions
InlineInlinables, inline inlinable functions
DeadBranchPrune, dead branch pruning
FindLiterallyCalls, find literally calls
LiteralUnroll, handles literal_unroll
ReconstructSSA, ssa
LiteralPropagationSubPipelinePass, Literal propagation
NopythonTypeInference, nopython frontend
PreLowerStripPhis, remove phis nodes
InlineOverloads, inline overloaded functions
NopythonRewrites, nopython rewrites
NoPythonSupportedFeatureValidation, ensure features that are in use are in a valid form
IRLegalization, ensure IR is legal prior to lowering
AnnotateTypes, annotate types
NativeLowering, native lowering
NoPythonBackend, nopython mode backend
DumpParforDiagnostics, dump parfor diagnostics
```

TODO:

-   Finish porting interpeter.py and analysis.py
-   Study remaining passes to see what is needed
-   Port type inference
-   Lower to MLIR (textual format)
-   Compile the MLIR and turn it into an executable py func
