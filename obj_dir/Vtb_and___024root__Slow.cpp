// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_and.h for the primary calling header

#include "Vtb_and__pch.h"
#include "Vtb_and__Syms.h"
#include "Vtb_and___024root.h"

void Vtb_and___024root___ctor_var_reset(Vtb_and___024root* vlSelf);

Vtb_and___024root::Vtb_and___024root(Vtb_and__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtb_and___024root___ctor_var_reset(this);
}

void Vtb_and___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtb_and___024root::~Vtb_and___024root() {
}
