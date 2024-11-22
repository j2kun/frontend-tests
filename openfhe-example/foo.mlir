func.func @foo(%a: i16, %b: i16) -> (i16) {
  %0 = arith.muli %a, %a : i16
  %1 = arith.muli %b, %b : i16
  %2 = arith.subi %0, %1 : i16
  func.return %2 : i16
}
