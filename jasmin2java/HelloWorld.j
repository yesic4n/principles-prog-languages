; HelloWorld.j

; Generated by ClassFileAnalyzer (Can)
; Analyzer and Disassembler for Java class files
; (Jasmin syntax 2, http://jasmin.sourceforge.net)
;
; ClassFileAnalyzer, version 0.7.0 


.bytecode 55.0
.source HelloWorld.java
.class HelloWorld
.super java/lang/Object

.method <init>()V
  .limit stack 1
  .limit locals 1
  .line 1
  0: aload_0
  1: invokespecial java/lang/Object/<init>()V
  4: return
.end method

.method public static main([Ljava/lang/String;)V
  .limit stack 6
  .limit locals 4
  .line 3
  0: iconst_5
  1: newarray int
  3: dup
  4: iconst_0
  5: iconst_1
  6: iastore
  7: dup
  8: iconst_1
  9: iconst_2
  10: iastore
  11: dup
  12: iconst_2
  13: iconst_3
  14: iastore
  15: dup
  16: iconst_3
  17: iconst_4
  18: iastore
  19: dup
  20: iconst_4
  21: iconst_5
  22: iastore
  23: astore_1
  .line 4
  24: iconst_5
  25: newarray int
  27: dup
  28: iconst_0
  29: iconst_1
  30: iastore
  31: dup
  32: iconst_1
  33: iconst_2
  34: iastore
  35: dup
  36: iconst_2
  37: iconst_3
  38: iastore
  39: dup
  40: iconst_3
  41: iconst_4
  42: iastore
  43: dup
  44: iconst_4
  45: iconst_5
  46: iastore
  47: astore_2
  .line 5
  48: iconst_4
  49: istore_3
  .line 6
  50: aload_2
  51: aload_1
  52: iconst_1
  53: iaload
  54: iload_3
  55: imul
  56: aload_2
  57: iload_3
  58: iaload
  59: aload_1
  60: aload_2
  61: iconst_2
  62: iaload
  63: iaload
  64: iadd
  65: iastore
  .line 7
  66: return
.end method

