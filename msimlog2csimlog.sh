#!/bin/bash

awk '$2 != "none"{
if ($2 == "add" || $2 == "sub" || $2 == "addi" || $2 == "subi" || $2 == "not" || $2 == "and" || $2 == "or" || $2 == "xor" || $2 == "nadd" || $2 == "nor" || $2 == "shift" || $2 == "shifti" || $2 == "iotf" || $2 == "read" || $2 == "load" || $2 == "loadr") {
printf "%05d: %-7s: r%02d <- %s\n" ,$1,$2,$3,$5;}
else if ($2 == "fadd" || $2 == "fsub" || $2 == "fmul" || $2 == "finv" || $2 == "fsqrt" || $2 == "itof" || $2 == "fload" || $2 == "floadr") {
printf "%05d: %-7s: f%02d <- %s\n" ,$1,$2,$3,$5;}
else {
printf "%05d: %-7s:\n" ,$1,$2};}
' $1
