name of processor : pearl_processor

number of master ports : 0
number of slave ports : 1
  slave port 0 : 
    name : pearl_processor_sl_ip
    id : 0
    data width : 32
    address width : 18
    info width      : 0
    protocol : CIO
    number of burst size bits : 2
    maximum burst size : 4
    has two clocks : false
number of stream in ports : 2
  stream in port 0 : 
    name : pearl_processor_st_ip0
    id : 0
    data width : 32
    has two clocks : false
  stream in port 1 : 
    name : pearl_processor_st_ip1
    id : 1
    data width : 32
    has two clocks : false
number of stream out ports : 2
  stream out port 0 : 
    name : pearl_processor_st_op0
    id : 0
    data width : 32
    has two clocks : false
  stream out port 1 : 
    name : pearl_processor_st_op1
    id : 1
    data width : 32
    has two clocks : false


=== Cell 0 specification ====================================================

cell name : pearl_processor_pearl

program counter width : 12
status register width : 9

instruction format : optimized
loop cache size : 0

number of master ports : 0
number of slave ports : 1
  slave port 0 : 
    name : pearl_sl_ip
    id : 0
    data width : 32
    address width : 18
    info width      : 0
    protocol : CIO
    connects to processor slave port : pearl_processor_sl_ip
number of stream in ports : 2
  stream in port 0 : 
    name : pearl_st_ip0
    id : 0
    data width : 32
    connects to processor stream in port : pearl_processor_st_ip0
  stream in port 1 : 
    name : pearl_st_ip1
    id : 1
    data width : 32
    connects to processor stream in port : pearl_processor_st_ip1
number of stream out ports : 2
  stream out port 0 : 
    name : pearl_st_op0
    id : 0
    data width : 32
    connects to processor stream out port : pearl_processor_st_op0
  stream out port 1 : 
    name : pearl_st_op1
    id : 1
    data width : 32
    connects to processor stream out port : pearl_processor_st_op1


=== View 0 specification ====================================================

view name : pearl_processor_pearl

number of register files : 4
  register file 0 : 
    name       : pearl_bp_pearl_rf1
    id         : 0
    kind       : 0
    capacity   : 16
    data width : 32
    register index width : 4
    number of read ports : 2
      read port 0 : 
        name       : pearl_bp_pearl_rf1_op0
        id         : 0
        data width : 32
        fan out    : 1
        sends data to argument ports : 
          pearl_bp_pearl_s1_ip0
      read port 1 : 
        name       : pearl_bp_pearl_rf1_op1
        id         : 1
        data width : 32
        fan out    : 1
        sends data to argument ports : 
          pearl_bp_pearl_s1_ip1
    number of write ports : 1
      write port 0 : 
        name         : pearl_bp_pearl_rf1_ip0
        id           : 0
        data width   : 32
        fan in       : 2
        ~tsat~ select width : 2
        receives data from buses : 
          pearl_bp_pearl_s1_op0_BUS
          pearl_bp_pearl_s2_op0_BUS
  register file 1 : 
    name       : pearl_bp_pearl_rf2
    id         : 1
    kind       : 0
    capacity   : 16
    data width : 32
    register index width : 4
    number of read ports : 3
      read port 0 : 
        name       : pearl_bp_pearl_rf2_op0
        id         : 0
        data width : 32
        fan out    : 1
        sends data to argument ports : 
          pearl_bp_pearl_s2_ip0
      read port 1 : 
        name       : pearl_bp_pearl_rf2_op1
        id         : 1
        data width : 32
        fan out    : 1
        sends data to argument ports : 
          pearl_bp_pearl_s2_ip1
      read port 2 : 
        name       : pearl_bp_pearl_rf2_op2
        id         : 2
        data width : 32
        fan out    : 1
        sends data to argument ports : 
          pearl_bp_pearl_s2_ip2
    number of write ports : 2
      write port 0 : 
        name         : pearl_bp_pearl_rf2_ip0
        id           : 0
        data width   : 32
        fan in       : 2
        ~tsat~ select width : 2
        receives data from buses : 
          pearl_bp_pearl_s1_op0_BUS
          pearl_bp_pearl_s2_op0_BUS
      write port 1 : 
        name         : pearl_bp_pearl_rf2_ip1
        id           : 1
        data width   : 32
        fan in       : 2
        ~tsat~ select width : 2
        receives data from buses : 
          pearl_bp_pearl_s2_op0_BUS
          pearl_bp_pearl_s2_op1_BUS
  register file 2 : 
    name       : pearl_bp_pearl_pc
    id         : 2
    kind       : 1
    capacity   : 1
    data width : 12
    register index width : 0
    number of read ports : 1
      read port 0 : 
        name       : pearl_bp_pearl_pc_rp
        id         : 0
        data width : 12
        fan out    : 1
        sends data to argument ports : 
          pearl_bp_pearl_s1_pc_in
    number of write ports : 1
      write port 0 : 
        name         : pearl_bp_pearl_pc_wp
        id           : 0
        data width   : 12
        fan in       : 1
        ~tsat~ select width : 1
        receives data from buses : 
          pearl_bp_pearl_s1_pc_BUS
  register file 3 : 
    name       : pearl_bp_pearl_sr
    id         : 3
    kind       : 2
    capacity   : 1
    data width : 9
    register index width : 0
    number of read ports : 1
      read port 0 : 
        name       : pearl_bp_pearl_sr_rp
        id         : 0
        data width : 9
        fan out    : 1
        sends data to argument ports : 
          pearl_bp_pearl_s1_sr_in
    number of write ports : 1
      write port 0 : 
        name         : pearl_bp_pearl_sr_wp
        id           : 0
        data width   : 9
        fan in       : 1
        ~tsat~ select width : 0
        receives data from buses : 
          pearl_bp_pearl_s1_sr_BUS

number of issue slots : 2
  issue slot 0 : 
    name          : pearl_bp_pearl_s1
    id            : 0
    number of argument ports  : 4
      argument port 0 : 
        name       : pearl_bp_pearl_s1_ip0
        id         : 0
        data width : 32
        receives data from read port : pearl_bp_pearl_rf1_op0
        sends data to guard ports : 
        sends data to input ports : 
          pearl_bp_pearl_s1_bru_ip0
          pearl_bp_pearl_s1_aru_ip1
          pearl_bp_pearl_s1_lgu_ip1
          pearl_bp_pearl_s1_shu_ip1
          pearl_bp_pearl_s1_seu_ip0
          pearl_bp_pearl_s1_psu_ip0
          pearl_bp_pearl_s1_sru_ip0
      argument port 1 : 
        name       : pearl_bp_pearl_s1_ip1
        id         : 1
        data width : 32
        receives data from read port : pearl_bp_pearl_rf1_op1
        sends data to guard ports : 
        sends data to input ports : 
          pearl_bp_pearl_s1_bru_ip2
          pearl_bp_pearl_s1_aru_ip0
          pearl_bp_pearl_s1_lgu_ip0
          pearl_bp_pearl_s1_shu_ip0
          pearl_bp_pearl_s1_psu_ip1
          pearl_bp_pearl_s1_sru_ip2
      argument port 2 : 
        name       : pearl_bp_pearl_s1_pc_in
        id         : 2
        data width : 12
        receives data from read port : pearl_bp_pearl_pc_rp
        sends data to guard ports : 
        sends data to input ports : 
          pearl_bp_pearl_s1_bru_dummy
      argument port 3 : 
        name       : pearl_bp_pearl_s1_sr_in
        id         : 3
        data width : 9
        receives data from read port : pearl_bp_pearl_sr_rp
        sends data to guard ports : 
        sends data to input ports : 
          pearl_bp_pearl_s1_suu_ip0
    number of immediate bypasses : 1
      immediate bypass id width  : 0
    number of result ports  : 3
      result port 0 : 
        name       : pearl_bp_pearl_s1_op0
        id         : 0
        data width : 32
        receives data from output ports : 
          pearl_bp_pearl_s1_sru_op0
          pearl_bp_pearl_s1_psu_op0
          pearl_bp_pearl_s1_seu_op0
          pearl_bp_pearl_s1_shu_op0
          pearl_bp_pearl_s1_lgu_op0
          pearl_bp_pearl_s1_aru_op0
          pearl_bp_pearl_s1_bru_op1
        sends data to buses : 
          pearl_bp_pearl_s1_op0_BUS
      result port 1 : 
        name       : pearl_bp_pearl_s1_pc
        id         : 1
        data width : 12
        receives data from output ports : 
          pearl_bp_pearl_s1_bru_op0
        sends data to buses : 
          pearl_bp_pearl_s1_pc_BUS
      result port 2 : 
        name       : pearl_bp_pearl_s1_sr
        id         : 2
        data width : 9
        receives data from output ports : 
          pearl_bp_pearl_s1_suu_op0
        sends data to buses : 
          pearl_bp_pearl_s1_sr_BUS
    immediate data width  : 13
    immediate data offset : 0
    immediate data encoding can be overlayed with register index encoding for read ports : 
      pearl_bp_pearl_rf1_op0, minimum bit position in immediate field = 0, maximum overlay width = 4
      pearl_bp_pearl_pc_rp, minimum bit position in immediate field = 0, maximum overlay width = 0
      pearl_bp_pearl_sr_rp, minimum bit position in immediate field = 0, maximum overlay width = 0

    number of function units  : 8
      function unit id width  : 3
      function unit 0 : 
        name                  : pearl_bp_pearl_s1_bru
        id                    : 0
        type name             : STD_BRU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s1_bru_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 4
          input port 0 : 
            name       : pearl_bp_pearl_s1_bru_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip0
          input port 1 : 
            name       : pearl_bp_pearl_s1_bru_ip1
            id         : 1
            data width : 0
            delay      : 0
            input port is unconnected
          input port 2 : 
            name       : pearl_bp_pearl_s1_bru_ip2
            id         : 2
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip1
          input port 3 : 
            name       : pearl_bp_pearl_s1_bru_dummy
            id         : 3
            data width : 12
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_pc_in
        number of output ports : 2
          output port 0 : 
            name       : pearl_bp_pearl_s1_bru_op0
            id         : 0
            data width : 12
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_pc
          output port 1 : 
            name       : pearl_bp_pearl_s1_bru_op1
            id         : 1
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_op0
        number of mmio ports : 0
        number of opcodes    : 5
          opcode 0 : 
            name : std_cjmptdec_i
            id   : 0
          opcode 1 : 
            name : std_cjmpf_i
            id   : 1
          opcode 2 : 
            name : std_cjmpt_i
            id   : 2
          opcode 3 : 
            name : std_jmp_i
            id   : 3
          opcode 4 : 
            name : std_jmp
            id   : 4
        number of optypes        : 4
        maximum optype code      : 3
        maximum base optype code : 7
          optype 0 : 
            name : std_jmp
            id   : 0
            code : 0
          optype 1 : 
            name : std_cjmpt
            id   : 1
            code : 1
          optype 2 : 
            name : std_cjmpf
            id   : 2
            code : 2
          optype 3 : 
            name : std_cjmptdec
            id   : 3
            code : 3
      function unit 1 : 
        name                  : pearl_bp_pearl_s1_suu
        id                    : 1
        type name             : STD_SUU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s1_suu_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 1
          input port 0 : 
            name       : pearl_bp_pearl_s1_suu_ip0
            id         : 0
            data width : 9
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_sr_in
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s1_suu_op0
            id         : 0
            data width : 9
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_sr
        number of mmio ports : 0
        number of opcodes    : 6
          opcode 0 : 
            name : std_lcoff
            id   : 0
          opcode 1 : 
            name : std_lcon
            id   : 1
          opcode 2 : 
            name : std_break
            id   : 2
          opcode 3 : 
            name : std_idle
            id   : 3
          opcode 4 : 
            name : std_flush
            id   : 4
          opcode 5 : 
            name : std_sleep
            id   : 5
        number of optypes        : 6
        maximum optype code      : 7
        maximum base optype code : 7
          optype 0 : 
            name : std_idle
            id   : 0
            code : 0
          optype 1 : 
            name : std_break
            id   : 1
            code : 1
          optype 2 : 
            name : std_sleep
            id   : 2
            code : 2
          optype 3 : 
            name : std_flush
            id   : 3
            code : 3
          optype 4 : 
            name : std_lcon
            id   : 4
            code : 6
          optype 5 : 
            name : std_lcoff
            id   : 5
            code : 7
      function unit 2 : 
        name                  : pearl_bp_pearl_s1_aru
        id                    : 2
        type name             : STD_ARU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s1_aru_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 3
          input port 0 : 
            name       : pearl_bp_pearl_s1_aru_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip1
          input port 1 : 
            name       : pearl_bp_pearl_s1_aru_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip0
          input port 2 : 
            name       : pearl_bp_pearl_s1_aru_ip2
            id         : 2
            data width : 0
            delay      : 0
            input port is unconnected
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s1_aru_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_op0
        number of mmio ports : 0
        number of opcodes    : 14
          opcode 0 : 
            name : std_neq_i
            id   : 0
          opcode 1 : 
            name : std_eq_i
            id   : 1
          opcode 2 : 
            name : std_sub_i
            id   : 2
          opcode 3 : 
            name : std_add_i
            id   : 3
          opcode 4 : 
            name : std_le_u
            id   : 4
          opcode 5 : 
            name : std_lt_u
            id   : 5
          opcode 6 : 
            name : std_le
            id   : 6
          opcode 7 : 
            name : std_lt
            id   : 7
          opcode 8 : 
            name : std_neq
            id   : 8
          opcode 9 : 
            name : std_eq
            id   : 9
          opcode 10 : 
            name : std_abs
            id   : 10
          opcode 11 : 
            name : std_neg
            id   : 11
          opcode 12 : 
            name : std_sub
            id   : 12
          opcode 13 : 
            name : std_add
            id   : 13
        number of optypes        : 10
        maximum optype code      : 21
        maximum base optype code : 24
          optype 0 : 
            name : std_add
            id   : 0
            code : 0
          optype 1 : 
            name : std_sub
            id   : 1
            code : 1
          optype 2 : 
            name : std_neg
            id   : 2
            code : 2
          optype 3 : 
            name : std_eq
            id   : 3
            code : 7
          optype 4 : 
            name : std_neq
            id   : 4
            code : 8
          optype 5 : 
            name : std_lt
            id   : 5
            code : 9
          optype 6 : 
            name : std_le
            id   : 6
            code : 10
          optype 7 : 
            name : std_lt_u
            id   : 7
            code : 11
          optype 8 : 
            name : std_le_u
            id   : 8
            code : 12
          optype 9 : 
            name : std_abs
            id   : 9
            code : 21
      function unit 3 : 
        name                  : pearl_bp_pearl_s1_lgu
        id                    : 3
        type name             : STD_LGU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s1_lgu_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 2
          input port 0 : 
            name       : pearl_bp_pearl_s1_lgu_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip1
          input port 1 : 
            name       : pearl_bp_pearl_s1_lgu_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip0
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s1_lgu_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_op0
        number of mmio ports : 0
        number of opcodes    : 7
          opcode 0 : 
            name : std_xor_i
            id   : 0
          opcode 1 : 
            name : std_or_i
            id   : 1
          opcode 2 : 
            name : std_and_i
            id   : 2
          opcode 3 : 
            name : std_xor
            id   : 3
          opcode 4 : 
            name : std_or
            id   : 4
          opcode 5 : 
            name : std_and
            id   : 5
          opcode 6 : 
            name : std_inv
            id   : 6
        number of optypes        : 4
        maximum optype code      : 3
        maximum base optype code : 10
          optype 0 : 
            name : std_inv
            id   : 0
            code : 0
          optype 1 : 
            name : std_and
            id   : 1
            code : 1
          optype 2 : 
            name : std_or
            id   : 2
            code : 2
          optype 3 : 
            name : std_xor
            id   : 3
            code : 3
      function unit 4 : 
        name                  : pearl_bp_pearl_s1_shu
        id                    : 4
        type name             : STD_SHU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s1_shu_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 2
          input port 0 : 
            name       : pearl_bp_pearl_s1_shu_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip1
          input port 1 : 
            name       : pearl_bp_pearl_s1_shu_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip0
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s1_shu_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_op0
        number of mmio ports : 0
        number of opcodes    : 6
          opcode 0 : 
            name : std_asr_i
            id   : 0
          opcode 1 : 
            name : std_lsr_i
            id   : 1
          opcode 2 : 
            name : std_lsl_i
            id   : 2
          opcode 3 : 
            name : std_asr
            id   : 3
          opcode 4 : 
            name : std_lsr
            id   : 4
          opcode 5 : 
            name : std_lsl
            id   : 5
        number of optypes        : 3
        maximum optype code      : 2
        maximum base optype code : 7
          optype 0 : 
            name : std_lsl
            id   : 0
            code : 0
          optype 1 : 
            name : std_lsr
            id   : 1
            code : 1
          optype 2 : 
            name : std_asr
            id   : 2
            code : 2
      function unit 5 : 
        name                  : pearl_bp_pearl_s1_seu
        id                    : 5
        type name             : STD_BMU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s1_seu_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 2
          input port 0 : 
            name       : pearl_bp_pearl_s1_seu_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip0
          input port 1 : 
            name       : pearl_bp_pearl_s1_seu_ip1
            id         : 1
            data width : 0
            delay      : 0
            input port is unconnected
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s1_seu_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_op0
        number of mmio ports : 0
        number of opcodes    : 4
          opcode 0 : 
            name : std_ze16
            id   : 0
          opcode 1 : 
            name : std_se16
            id   : 1
          opcode 2 : 
            name : std_ze8
            id   : 2
          opcode 3 : 
            name : std_se8
            id   : 3
        number of optypes        : 4
        maximum optype code      : 13
        maximum base optype code : 13
          optype 0 : 
            name : std_se8
            id   : 0
            code : 10
          optype 1 : 
            name : std_ze8
            id   : 1
            code : 11
          optype 2 : 
            name : std_se16
            id   : 2
            code : 12
          optype 3 : 
            name : std_ze16
            id   : 3
            code : 13
      function unit 6 : 
        name                  : pearl_bp_pearl_s1_psu
        id                    : 6
        type name             : STD_PSU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s1_psu_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 3
          input port 0 : 
            name       : pearl_bp_pearl_s1_psu_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip0
          input port 1 : 
            name       : pearl_bp_pearl_s1_psu_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip1
          input port 2 : 
            name       : pearl_bp_pearl_s1_psu_ip2
            id         : 2
            data width : 0
            delay      : 0
            input port is unconnected
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s1_psu_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_op0
        number of mmio ports : 0
        number of opcodes    : 3
          opcode 0 : 
            name : std_immh
            id   : 0
          opcode 1 : 
            name : std_imm
            id   : 1
          opcode 2 : 
            name : std_pass
            id   : 2
        number of optypes        : 2
        maximum optype code      : 2
        maximum base optype code : 3
          optype 0 : 
            name : std_lslhalfor
            id   : 0
            code : 0
          optype 1 : 
            name : std_pass
            id   : 1
            code : 2
      function unit 7 : 
        name                  : pearl_bp_pearl_s1_sru
        id                    : 7
        type name             : STD_LSU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s1_sru_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 3
          input port 0 : 
            name       : pearl_bp_pearl_s1_sru_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip0
          input port 1 : 
            name       : pearl_bp_pearl_s1_sru_ip1
            id         : 1
            data width : 0
            delay      : 0
            input port is unconnected
          input port 2 : 
            name       : pearl_bp_pearl_s1_sru_ip2
            id         : 2
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s1_ip1
        number of output ports : 2
          output port 0 : 
            name       : pearl_bp_pearl_s1_sru_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s1_op0
          output port 1 : 
            name       : pearl_bp_pearl_s1_sru_op1
            id         : 1
            data width : 0
            delay      : 0
            output port is unconnected
        number of mmio ports : 1
          mmio port id       : 0
            send delay      : 0
            receive delay   : 0
            address width   : 3
            data width      : 32
            info width      : 0
            connects to LSU port : pearl_bp_fifo_fifo_core_ip
        number of opcodes    : 2
          opcode 0 : 
            name : std_snd
            id   : 0
          opcode 1 : 
            name : std_rcv
            id   : 1
        number of optypes        : 2
        maximum optype code      : 1
        maximum base optype code : 13
          optype 0 : 
            name : std_ld
            id   : 0
            code : 0
          optype 1 : 
            name : std_st
            id   : 1
            code : 1

    number of opcodes : 47
    ~tsat~ opcode width : 6
      opcode 0 : 
        name                            : std_cjmptdec_i
        id                              : 0
        executed on function unit       : 0 = ('pearl_bp_pearl_s1_bru')
        optype name                     : std_cjmptdec
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 12
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_bru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_bru_ip2
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_bru_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s1_bru_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 1 : 
        name                            : std_cjmpf_i
        id                              : 1
        executed on function unit       : 0 = ('pearl_bp_pearl_s1_bru')
        optype name                     : std_cjmpf
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 12
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_bru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_bru_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_bru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 2 : 
        name                            : std_cjmpt_i
        id                              : 2
        executed on function unit       : 0 = ('pearl_bp_pearl_s1_bru')
        optype name                     : std_cjmpt
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 12
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_bru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_bru_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_bru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 3 : 
        name                            : std_jmp_i
        id                              : 3
        executed on function unit       : 0 = ('pearl_bp_pearl_s1_bru')
        optype name                     : std_jmp
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 1
            immediate data width  : 12
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_bru_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_bru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 4 : 
        name                            : std_jmp
        id                              : 4
        executed on function unit       : 0 = ('pearl_bp_pearl_s1_bru')
        optype name                     : std_jmp
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_bru_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_bru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 5 : 
        name                            : std_lcoff
        id                              : 5
        executed on function unit       : 1 = ('pearl_bp_pearl_s1_suu')
        optype name                     : std_lcoff
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_suu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_suu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 6 : 
        name                            : std_lcon
        id                              : 6
        executed on function unit       : 1 = ('pearl_bp_pearl_s1_suu')
        optype name                     : std_lcon
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_suu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_suu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 7 : 
        name                            : std_break
        id                              : 7
        executed on function unit       : 1 = ('pearl_bp_pearl_s1_suu')
        optype name                     : std_break
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_suu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_suu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 8 : 
        name                            : std_idle
        id                              : 8
        executed on function unit       : 1 = ('pearl_bp_pearl_s1_suu')
        optype name                     : std_idle
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_suu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_suu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 9 : 
        name                            : std_flush
        id                              : 9
        executed on function unit       : 1 = ('pearl_bp_pearl_s1_suu')
        optype name                     : std_flush
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_suu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_suu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 10 : 
        name                            : std_sleep
        id                              : 10
        executed on function unit       : 1 = ('pearl_bp_pearl_s1_suu')
        optype name                     : std_sleep
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_suu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_suu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 11 : 
        name                            : std_neq_i
        id                              : 11
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_neq
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 12 : 
        name                            : std_eq_i
        id                              : 12
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_eq
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 13 : 
        name                            : std_sub_i
        id                              : 13
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_sub
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 14 : 
        name                            : std_add_i
        id                              : 14
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_add
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 15 : 
        name                            : std_le_u
        id                              : 15
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_le_u
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 16 : 
        name                            : std_lt_u
        id                              : 16
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_lt_u
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 17 : 
        name                            : std_le
        id                              : 17
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_le
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 18 : 
        name                            : std_lt
        id                              : 18
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_lt
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 19 : 
        name                            : std_neq
        id                              : 19
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_neq
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 20 : 
        name                            : std_eq
        id                              : 20
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_eq
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 21 : 
        name                            : std_abs
        id                              : 21
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_abs
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 22 : 
        name                            : std_neg
        id                              : 22
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_neg
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 23 : 
        name                            : std_sub
        id                              : 23
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_sub
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 24 : 
        name                            : std_add
        id                              : 24
        executed on function unit       : 2 = ('pearl_bp_pearl_s1_aru')
        optype name                     : std_add
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 25 : 
        name                            : std_xor_i
        id                              : 25
        executed on function unit       : 3 = ('pearl_bp_pearl_s1_lgu')
        optype name                     : std_xor
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 26 : 
        name                            : std_or_i
        id                              : 26
        executed on function unit       : 3 = ('pearl_bp_pearl_s1_lgu')
        optype name                     : std_or
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 27 : 
        name                            : std_and_i
        id                              : 27
        executed on function unit       : 3 = ('pearl_bp_pearl_s1_lgu')
        optype name                     : std_and
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 28 : 
        name                            : std_xor
        id                              : 28
        executed on function unit       : 3 = ('pearl_bp_pearl_s1_lgu')
        optype name                     : std_xor
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 29 : 
        name                            : std_or
        id                              : 29
        executed on function unit       : 3 = ('pearl_bp_pearl_s1_lgu')
        optype name                     : std_or
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 30 : 
        name                            : std_and
        id                              : 30
        executed on function unit       : 3 = ('pearl_bp_pearl_s1_lgu')
        optype name                     : std_and
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 31 : 
        name                            : std_inv
        id                              : 31
        executed on function unit       : 3 = ('pearl_bp_pearl_s1_lgu')
        optype name                     : std_inv
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_lgu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 32 : 
        name                            : std_asr_i
        id                              : 32
        executed on function unit       : 4 = ('pearl_bp_pearl_s1_shu')
        optype name                     : std_asr
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_shu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 33 : 
        name                            : std_lsr_i
        id                              : 33
        executed on function unit       : 4 = ('pearl_bp_pearl_s1_shu')
        optype name                     : std_lsr
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_shu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 34 : 
        name                            : std_lsl_i
        id                              : 34
        executed on function unit       : 4 = ('pearl_bp_pearl_s1_shu')
        optype name                     : std_lsl
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_shu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 35 : 
        name                            : std_asr
        id                              : 35
        executed on function unit       : 4 = ('pearl_bp_pearl_s1_shu')
        optype name                     : std_asr
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_shu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 36 : 
        name                            : std_lsr
        id                              : 36
        executed on function unit       : 4 = ('pearl_bp_pearl_s1_shu')
        optype name                     : std_lsr
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_shu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 37 : 
        name                            : std_lsl
        id                              : 37
        executed on function unit       : 4 = ('pearl_bp_pearl_s1_shu')
        optype name                     : std_lsl
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_shu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_shu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 38 : 
        name                            : std_ze16
        id                              : 38
        executed on function unit       : 5 = ('pearl_bp_pearl_s1_seu')
        optype name                     : std_ze16
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_seu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_seu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 39 : 
        name                            : std_se16
        id                              : 39
        executed on function unit       : 5 = ('pearl_bp_pearl_s1_seu')
        optype name                     : std_se16
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_seu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_seu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 40 : 
        name                            : std_ze8
        id                              : 40
        executed on function unit       : 5 = ('pearl_bp_pearl_s1_seu')
        optype name                     : std_ze8
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_seu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_seu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 41 : 
        name                            : std_se8
        id                              : 41
        executed on function unit       : 5 = ('pearl_bp_pearl_s1_seu')
        optype name                     : std_se8
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_seu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_seu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 42 : 
        name                            : std_immh
        id                              : 42
        executed on function unit       : 6 = ('pearl_bp_pearl_s1_psu')
        optype name                     : std_lslhalfor
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_psu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_psu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_psu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 43 : 
        name                            : std_imm
        id                              : 43
        executed on function unit       : 6 = ('pearl_bp_pearl_s1_psu')
        optype name                     : std_pass
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 1
            immediate data width  : 13
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_psu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_psu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 44 : 
        name                            : std_pass
        id                              : 44
        executed on function unit       : 6 = ('pearl_bp_pearl_s1_psu')
        optype name                     : std_pass
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_psu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_psu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 45 : 
        name                            : std_snd
        id                              : 45
        executed on function unit       : 7 = ('pearl_bp_pearl_s1_sru')
        optype name                     : std_st
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 1
            immediate data offset : 2
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_sru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s1_sru_ip2
        number of results               : 0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 46 : 
        name                            : std_rcv
        id                              : 46
        executed on function unit       : 7 = ('pearl_bp_pearl_s1_sru')
        optype name                     : std_ld
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 1
            immediate data width  : 1
            immediate data offset : 2
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s1_sru_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s1_sru_op0
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
  issue slot 1 : 
    name          : pearl_bp_pearl_s2
    id            : 1
    number of argument ports  : 3
      argument port 0 : 
        name       : pearl_bp_pearl_s2_ip0
        id         : 0
        data width : 32
        receives data from read port : pearl_bp_pearl_rf2_op0
        sends data to guard ports : 
        sends data to input ports : 
          pearl_bp_pearl_s2_aru_ip1
          pearl_bp_pearl_s2_lgu_ip1
          pearl_bp_pearl_s2_mul_ip0
          pearl_bp_pearl_s2_psu_ip0
          pearl_bp_pearl_s2_lsu_ip1
      argument port 1 : 
        name       : pearl_bp_pearl_s2_ip1
        id         : 1
        data width : 32
        receives data from read port : pearl_bp_pearl_rf2_op1
        sends data to guard ports : 
        sends data to input ports : 
          pearl_bp_pearl_s2_aru_ip0
          pearl_bp_pearl_s2_lgu_ip0
          pearl_bp_pearl_s2_mul_ip1
          pearl_bp_pearl_s2_psu_ip1
          pearl_bp_pearl_s2_lsu_ip0
      argument port 2 : 
        name       : pearl_bp_pearl_s2_ip2
        id         : 2
        data width : 32
        receives data from read port : pearl_bp_pearl_rf2_op2
        sends data to guard ports : 
        sends data to input ports : 
          pearl_bp_pearl_s2_aru_ip2
          pearl_bp_pearl_s2_psu_ip2
          pearl_bp_pearl_s2_lsu_ip2
    number of immediate bypasses : 1
      immediate bypass id width  : 0
    number of result ports  : 2
      result port 0 : 
        name       : pearl_bp_pearl_s2_op0
        id         : 0
        data width : 32
        receives data from output ports : 
          pearl_bp_pearl_s2_lsu_op0
          pearl_bp_pearl_s2_psu_op0
          pearl_bp_pearl_s2_mul_op1
          pearl_bp_pearl_s2_lgu_op0
          pearl_bp_pearl_s2_aru_op0
        sends data to buses : 
          pearl_bp_pearl_s2_op0_BUS
      result port 1 : 
        name       : pearl_bp_pearl_s2_op1
        id         : 1
        data width : 32
        receives data from output ports : 
          pearl_bp_pearl_s2_lsu_op1
        sends data to buses : 
          pearl_bp_pearl_s2_op1_BUS
    immediate data width  : 5
    immediate data offset : 0
    immediate data encoding can be overlayed with register index encoding for read ports : 
      pearl_bp_pearl_rf2_op0, minimum bit position in immediate field = 0, maximum overlay width = 4

    number of function units  : 5
      function unit id width  : 3
      function unit 0 : 
        name                  : pearl_bp_pearl_s2_aru
        id                    : 0
        type name             : STD_ARU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s2_aru_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 3
          input port 0 : 
            name       : pearl_bp_pearl_s2_aru_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip1
          input port 1 : 
            name       : pearl_bp_pearl_s2_aru_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip0
          input port 2 : 
            name       : pearl_bp_pearl_s2_aru_ip2
            id         : 2
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip2
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s2_aru_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s2_op0
        number of mmio ports : 0
        number of opcodes    : 15
          opcode 0 : 
            name : std_modadd
            id   : 0
          opcode 1 : 
            name : std_neq_i
            id   : 1
          opcode 2 : 
            name : std_eq_i
            id   : 2
          opcode 3 : 
            name : std_sub_i
            id   : 3
          opcode 4 : 
            name : std_add_i
            id   : 4
          opcode 5 : 
            name : std_le_u
            id   : 5
          opcode 6 : 
            name : std_lt_u
            id   : 6
          opcode 7 : 
            name : std_le
            id   : 7
          opcode 8 : 
            name : std_lt
            id   : 8
          opcode 9 : 
            name : std_neq
            id   : 9
          opcode 10 : 
            name : std_eq
            id   : 10
          opcode 11 : 
            name : std_abs
            id   : 11
          opcode 12 : 
            name : std_neg
            id   : 12
          opcode 13 : 
            name : std_sub
            id   : 13
          opcode 14 : 
            name : std_add
            id   : 14
        number of optypes        : 11
        maximum optype code      : 24
        maximum base optype code : 24
          optype 0 : 
            name : std_add
            id   : 0
            code : 0
          optype 1 : 
            name : std_sub
            id   : 1
            code : 1
          optype 2 : 
            name : std_neg
            id   : 2
            code : 2
          optype 3 : 
            name : std_eq
            id   : 3
            code : 7
          optype 4 : 
            name : std_neq
            id   : 4
            code : 8
          optype 5 : 
            name : std_lt
            id   : 5
            code : 9
          optype 6 : 
            name : std_le
            id   : 6
            code : 10
          optype 7 : 
            name : std_lt_u
            id   : 7
            code : 11
          optype 8 : 
            name : std_le_u
            id   : 8
            code : 12
          optype 9 : 
            name : std_abs
            id   : 9
            code : 21
          optype 10 : 
            name : std_modadd
            id   : 10
            code : 24
      function unit 1 : 
        name                  : pearl_bp_pearl_s2_lgu
        id                    : 1
        type name             : STD_LGU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s2_lgu_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 2
          input port 0 : 
            name       : pearl_bp_pearl_s2_lgu_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip1
          input port 1 : 
            name       : pearl_bp_pearl_s2_lgu_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip0
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s2_lgu_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s2_op0
        number of mmio ports : 0
        number of opcodes    : 7
          opcode 0 : 
            name : std_xor_i
            id   : 0
          opcode 1 : 
            name : std_or_i
            id   : 1
          opcode 2 : 
            name : std_and_i
            id   : 2
          opcode 3 : 
            name : std_xor
            id   : 3
          opcode 4 : 
            name : std_or
            id   : 4
          opcode 5 : 
            name : std_and
            id   : 5
          opcode 6 : 
            name : std_inv
            id   : 6
        number of optypes        : 4
        maximum optype code      : 3
        maximum base optype code : 10
          optype 0 : 
            name : std_inv
            id   : 0
            code : 0
          optype 1 : 
            name : std_and
            id   : 1
            code : 1
          optype 2 : 
            name : std_or
            id   : 2
            code : 2
          optype 3 : 
            name : std_xor
            id   : 3
            code : 3
      function unit 2 : 
        name                  : pearl_bp_pearl_s2_mul
        id                    : 2
        type name             : STD_MAC
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s2_mul_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 3
          input port 0 : 
            name       : pearl_bp_pearl_s2_mul_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip0
          input port 1 : 
            name       : pearl_bp_pearl_s2_mul_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip1
          input port 2 : 
            name       : pearl_bp_pearl_s2_mul_ip2
            id         : 2
            data width : 0
            delay      : 0
            input port is unconnected
        number of output ports : 2
          output port 0 : 
            name       : pearl_bp_pearl_s2_mul_op0
            id         : 0
            data width : 0
            delay      : 0
            output port is unconnected
          output port 1 : 
            name       : pearl_bp_pearl_s2_mul_op1
            id         : 1
            data width : 32
            delay      : 1
            sends data to result port : pearl_bp_pearl_s2_op0
        number of mmio ports : 0
        number of opcodes    : 4
          opcode 0 : 
            name : std_mul_iu
            id   : 0
          opcode 1 : 
            name : std_mul_i
            id   : 1
          opcode 2 : 
            name : std_mul_u
            id   : 2
          opcode 3 : 
            name : std_mul
            id   : 3
        number of optypes        : 2
        maximum optype code      : 1
        maximum base optype code : 9
          optype 0 : 
            name : std_mul_u
            id   : 0
            code : 0
          optype 1 : 
            name : std_mul
            id   : 1
            code : 1
      function unit 3 : 
        name                  : pearl_bp_pearl_s2_psu
        id                    : 3
        type name             : STD_PSU
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s2_psu_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 3
          input port 0 : 
            name       : pearl_bp_pearl_s2_psu_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip0
          input port 1 : 
            name       : pearl_bp_pearl_s2_psu_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip1
          input port 2 : 
            name       : pearl_bp_pearl_s2_psu_ip2
            id         : 2
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip2
        number of output ports : 1
          output port 0 : 
            name       : pearl_bp_pearl_s2_psu_op0
            id         : 0
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s2_op0
        number of mmio ports : 0
        number of opcodes    : 4
          opcode 0 : 
            name : std_mux
            id   : 0
          opcode 1 : 
            name : std_immh
            id   : 1
          opcode 2 : 
            name : std_imm
            id   : 2
          opcode 3 : 
            name : std_pass
            id   : 3
        number of optypes        : 3
        maximum optype code      : 3
        maximum base optype code : 3
          optype 0 : 
            name : std_lslhalfor
            id   : 0
            code : 0
          optype 1 : 
            name : std_pass
            id   : 1
            code : 2
          optype 2 : 
            name : std_mux
            id   : 2
            code : 3
      function unit 4 : 
        name                  : pearl_bp_pearl_s2_lsu
        id                    : 4
        type name             : STD_LSU_V
        RTL implementation    : builtin
        addressability        : 1 byte(s)
        isolated inputs       : true
        number of guard ports : 1
          guard port 0 : 
            name       : pearl_bp_pearl_s2_lsu_g
            id         : 0
            data width : 0
            delay      : 0
            receives data from argument port : 
        number of input ports  : 3
          input port 0 : 
            name       : pearl_bp_pearl_s2_lsu_ip0
            id         : 0
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip1
          input port 1 : 
            name       : pearl_bp_pearl_s2_lsu_ip1
            id         : 1
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip0
          input port 2 : 
            name       : pearl_bp_pearl_s2_lsu_ip2
            id         : 2
            data width : 32
            delay      : 0
            receives data from argument port : pearl_bp_pearl_s2_ip2
        number of output ports : 2
          output port 0 : 
            name       : pearl_bp_pearl_s2_lsu_op0
            id         : 0
            data width : 32
            delay      : 1
            sends data to result port : pearl_bp_pearl_s2_op0
          output port 1 : 
            name       : pearl_bp_pearl_s2_lsu_op1
            id         : 1
            data width : 32
            delay      : 0
            sends data to result port : pearl_bp_pearl_s2_op1
        number of mmio ports : 1
          mmio port id       : 1
            send delay      : 0
            receive delay   : 1
            address width   : 16
            data width      : 32
            info width      : 0
            connects to LSU port : pearl_bp_dmem_mem_core_ip
        number of opcodes    : 32
          opcode 0 : 
            name : std_ld8au_is
            id   : 0
          opcode 1 : 
            name : std_ld16au_is
            id   : 1
          opcode 2 : 
            name : std_st8au_i
            id   : 2
          opcode 3 : 
            name : std_ld8au_i
            id   : 3
          opcode 4 : 
            name : std_st16au_i
            id   : 4
          opcode 5 : 
            name : std_ld16au_i
            id   : 5
          opcode 6 : 
            name : std_st32au_i
            id   : 6
          opcode 7 : 
            name : std_ld32au_i
            id   : 7
          opcode 8 : 
            name : std_ld8oi_is
            id   : 8
          opcode 9 : 
            name : std_ld16oi_is
            id   : 9
          opcode 10 : 
            name : std_st8oi_i
            id   : 10
          opcode 11 : 
            name : std_ld8oi_i
            id   : 11
          opcode 12 : 
            name : std_st16oi_i
            id   : 12
          opcode 13 : 
            name : std_ld16oi_i
            id   : 13
          opcode 14 : 
            name : std_st32oi_i
            id   : 14
          opcode 15 : 
            name : std_ld32oi_i
            id   : 15
          opcode 16 : 
            name : std_ld8au_s
            id   : 16
          opcode 17 : 
            name : std_ld16au_s
            id   : 17
          opcode 18 : 
            name : std_st8au
            id   : 18
          opcode 19 : 
            name : std_ld8au
            id   : 19
          opcode 20 : 
            name : std_st16au
            id   : 20
          opcode 21 : 
            name : std_ld16au
            id   : 21
          opcode 22 : 
            name : std_st32au
            id   : 22
          opcode 23 : 
            name : std_ld32au
            id   : 23
          opcode 24 : 
            name : std_ld8oi_s
            id   : 24
          opcode 25 : 
            name : std_ld16oi_s
            id   : 25
          opcode 26 : 
            name : std_st8oi
            id   : 26
          opcode 27 : 
            name : std_ld8oi
            id   : 27
          opcode 28 : 
            name : std_st16oi
            id   : 28
          opcode 29 : 
            name : std_ld16oi
            id   : 29
          opcode 30 : 
            name : std_st32oi
            id   : 30
          opcode 31 : 
            name : std_ld32oi
            id   : 31
        number of optypes        : 16
        maximum optype code      : 66
        maximum base optype code : 66
          optype 0 : 
            name : std_ld32oi
            id   : 0
            code : 34
          optype 1 : 
            name : std_st32oi
            id   : 1
            code : 35
          optype 2 : 
            name : std_ld16oi
            id   : 2
            code : 37
          optype 3 : 
            name : std_st16oi
            id   : 3
            code : 38
          optype 4 : 
            name : std_ld16oi_s
            id   : 4
            code : 39
          optype 5 : 
            name : std_ld8oi
            id   : 5
            code : 40
          optype 6 : 
            name : std_st8oi
            id   : 6
            code : 41
          optype 7 : 
            name : std_ld8oi_s
            id   : 7
            code : 42
          optype 8 : 
            name : std_ld32au
            id   : 8
            code : 58
          optype 9 : 
            name : std_st32au
            id   : 9
            code : 59
          optype 10 : 
            name : std_ld16au
            id   : 10
            code : 61
          optype 11 : 
            name : std_st16au
            id   : 11
            code : 62
          optype 12 : 
            name : std_ld16au_s
            id   : 12
            code : 63
          optype 13 : 
            name : std_ld8au
            id   : 13
            code : 64
          optype 14 : 
            name : std_st8au
            id   : 14
            code : 65
          optype 15 : 
            name : std_ld8au_s
            id   : 15
            code : 66

    number of opcodes : 62
    ~tsat~ opcode width : 6
      opcode 0 : 
        name                            : std_modadd
        id                              : 0
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_modadd
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 1 : 
        name                            : std_neq_i
        id                              : 1
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_neq
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 2 : 
        name                            : std_eq_i
        id                              : 2
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_eq
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 3 : 
        name                            : std_sub_i
        id                              : 3
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_sub
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 4 : 
        name                            : std_add_i
        id                              : 4
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_add
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 5 : 
        name                            : std_le_u
        id                              : 5
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_le_u
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 6 : 
        name                            : std_lt_u
        id                              : 6
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_lt_u
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 7 : 
        name                            : std_le
        id                              : 7
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_le
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 8 : 
        name                            : std_lt
        id                              : 8
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_lt
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 9 : 
        name                            : std_neq
        id                              : 9
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_neq
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 10 : 
        name                            : std_eq
        id                              : 10
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_eq
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 11 : 
        name                            : std_abs
        id                              : 11
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_abs
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 12 : 
        name                            : std_neg
        id                              : 12
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_neg
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 13 : 
        name                            : std_sub
        id                              : 13
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_sub
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 14 : 
        name                            : std_add
        id                              : 14
        executed on function unit       : 0 = ('pearl_bp_pearl_s2_aru')
        optype name                     : std_add
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_aru_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_aru_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 15 : 
        name                            : std_xor_i
        id                              : 15
        executed on function unit       : 1 = ('pearl_bp_pearl_s2_lgu')
        optype name                     : std_xor
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 16 : 
        name                            : std_or_i
        id                              : 16
        executed on function unit       : 1 = ('pearl_bp_pearl_s2_lgu')
        optype name                     : std_or
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 17 : 
        name                            : std_and_i
        id                              : 17
        executed on function unit       : 1 = ('pearl_bp_pearl_s2_lgu')
        optype name                     : std_and
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 18 : 
        name                            : std_xor
        id                              : 18
        executed on function unit       : 1 = ('pearl_bp_pearl_s2_lgu')
        optype name                     : std_xor
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 19 : 
        name                            : std_or
        id                              : 19
        executed on function unit       : 1 = ('pearl_bp_pearl_s2_lgu')
        optype name                     : std_or
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 20 : 
        name                            : std_and
        id                              : 20
        executed on function unit       : 1 = ('pearl_bp_pearl_s2_lgu')
        optype name                     : std_and
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 21 : 
        name                            : std_inv
        id                              : 21
        executed on function unit       : 1 = ('pearl_bp_pearl_s2_lgu')
        optype name                     : std_inv
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lgu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lgu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 22 : 
        name                            : std_mul_iu
        id                              : 22
        executed on function unit       : 2 = ('pearl_bp_pearl_s2_mul')
        optype name                     : std_mul_u
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_mul_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_mul_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_mul_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 23 : 
        name                            : std_mul_i
        id                              : 23
        executed on function unit       : 2 = ('pearl_bp_pearl_s2_mul')
        optype name                     : std_mul
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_mul_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_mul_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_mul_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 24 : 
        name                            : std_mul_u
        id                              : 24
        executed on function unit       : 2 = ('pearl_bp_pearl_s2_mul')
        optype name                     : std_mul_u
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_mul_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_mul_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_mul_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 25 : 
        name                            : std_mul
        id                              : 25
        executed on function unit       : 2 = ('pearl_bp_pearl_s2_mul')
        optype name                     : std_mul
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_mul_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_mul_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_mul_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 26 : 
        name                            : std_mux
        id                              : 26
        executed on function unit       : 3 = ('pearl_bp_pearl_s2_psu')
        optype name                     : std_mux
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_psu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_psu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_psu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_psu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 27 : 
        name                            : std_immh
        id                              : 27
        executed on function unit       : 3 = ('pearl_bp_pearl_s2_psu')
        optype name                     : std_lslhalfor
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : unsigned
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_psu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_psu_ip1
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_psu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 28 : 
        name                            : std_imm
        id                              : 28
        executed on function unit       : 3 = ('pearl_bp_pearl_s2_psu')
        optype name                     : std_pass
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_psu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_psu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 29 : 
        name                            : std_pass
        id                              : 29
        executed on function unit       : 3 = ('pearl_bp_pearl_s2_psu')
        optype name                     : std_pass
        number of guards                : 0
        number of (immediate) arguments : 1
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_psu_ip0
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_psu_op0
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 0
      opcode 30 : 
        name                            : std_ld8au_is
        id                              : 30
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld8au_s
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 31 : 
        name                            : std_ld16au_is
        id                              : 31
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld16au_s
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 32 : 
        name                            : std_st8au_i
        id                              : 32
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st8au
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 33 : 
        name                            : std_ld8au_i
        id                              : 33
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld8au
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 34 : 
        name                            : std_st16au_i
        id                              : 34
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st16au
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 35 : 
        name                            : std_ld16au_i
        id                              : 35
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld16au
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 36 : 
        name                            : std_st32au_i
        id                              : 36
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st32au
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 37 : 
        name                            : std_ld32au_i
        id                              : 37
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld32au
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 38 : 
        name                            : std_ld8oi_is
        id                              : 38
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld8oi_s
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 39 : 
        name                            : std_ld16oi_is
        id                              : 39
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld16oi_s
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 40 : 
        name                            : std_st8oi_i
        id                              : 40
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st8oi
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 41 : 
        name                            : std_ld8oi_i
        id                              : 41
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld8oi
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 42 : 
        name                            : std_st16oi_i
        id                              : 42
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st16oi
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 43 : 
        name                            : std_ld16oi_i
        id                              : 43
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld16oi
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 44 : 
        name                            : std_st32oi_i
        id                              : 44
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st32oi
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 45 : 
        name                            : std_ld32oi_i
        id                              : 45
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld32oi
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 1
            immediate data width  : 5
            immediate data offset : 0
            immediate bypass id   : 0
            immediate data type  : signed
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 46 : 
        name                            : std_ld8au_s
        id                              : 46
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld8au_s
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 47 : 
        name                            : std_ld16au_s
        id                              : 47
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld16au_s
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 48 : 
        name                            : std_st8au
        id                              : 48
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st8au
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 49 : 
        name                            : std_ld8au
        id                              : 49
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld8au
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 50 : 
        name                            : std_st16au
        id                              : 50
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st16au
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 51 : 
        name                            : std_ld16au
        id                              : 51
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld16au
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 52 : 
        name                            : std_st32au
        id                              : 52
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st32au
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 53 : 
        name                            : std_ld32au
        id                              : 53
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld32au
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 54 : 
        name                            : std_ld8oi_s
        id                              : 54
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld8oi_s
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 55 : 
        name                            : std_ld16oi_s
        id                              : 55
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld16oi_s
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 56 : 
        name                            : std_st8oi
        id                              : 56
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st8oi
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 57 : 
        name                            : std_ld8oi
        id                              : 57
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld8oi
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 58 : 
        name                            : std_st16oi
        id                              : 58
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st16oi
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 59 : 
        name                            : std_ld16oi
        id                              : 59
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld16oi
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1
      opcode 60 : 
        name                            : std_st32oi
        id                              : 60
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_st32oi
        number of guards                : 0
        number of (immediate) arguments : 3
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
          argument 2 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip2
        number of results               : 1
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 0
        number of mmio ports used for storing : 1
      opcode 61 : 
        name                            : std_ld32oi
        id                              : 61
        executed on function unit       : 4 = ('pearl_bp_pearl_s2_lsu')
        optype name                     : std_ld32oi
        number of guards                : 0
        number of (immediate) arguments : 2
          included number of immediate arguments : 0
          argument 0 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip0
          argument 1 : 
            uses input port with name : pearl_bp_pearl_s2_lsu_ip1
        number of results               : 2
          result 0 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op0
          result 1 : 
            uses output port with name : pearl_bp_pearl_s2_lsu_op1
        number of mmio ports used for loading : 1
        number of mmio ports used for storing : 1

number of buses : 5
  bus 0 : 
    name                : pearl_bp_pearl_s2_op1_BUS
    id                  : 0
    width               : 32
    fan in              : 1
    ~tsat~ select width : 0
    receives data from result ports : 
          pearl_bp_pearl_s2_op1
    sends data to write ports : 
          pearl_bp_pearl_rf2_ip1
  bus 1 : 
    name                : pearl_bp_pearl_s2_op0_BUS
    id                  : 1
    width               : 32
    fan in              : 1
    ~tsat~ select width : 0
    receives data from result ports : 
          pearl_bp_pearl_s2_op0
    sends data to write ports : 
          pearl_bp_pearl_rf2_ip1
          pearl_bp_pearl_rf2_ip0
          pearl_bp_pearl_rf1_ip0
  bus 2 : 
    name                : pearl_bp_pearl_s1_sr_BUS
    id                  : 2
    width               : 9
    fan in              : 1
    ~tsat~ select width : 0
    receives data from result ports : 
          pearl_bp_pearl_s1_sr
    sends data to write ports : 
          pearl_bp_pearl_sr_wp
  bus 3 : 
    name                : pearl_bp_pearl_s1_pc_BUS
    id                  : 3
    width               : 12
    fan in              : 1
    ~tsat~ select width : 0
    receives data from result ports : 
          pearl_bp_pearl_s1_pc
    sends data to write ports : 
          pearl_bp_pearl_pc_wp
  bus 4 : 
    name                : pearl_bp_pearl_s1_op0_BUS
    id                  : 4
    width               : 32
    fan in              : 1
    ~tsat~ select width : 0
    receives data from result ports : 
          pearl_bp_pearl_s1_op0
    sends data to write ports : 
          pearl_bp_pearl_rf2_ip0
          pearl_bp_pearl_rf1_ip0

number of mmio ports : 2
  mmio port 0 : 
    mmio port name (sending port) : pearl_bp_pearl_s1_sru_mmo
    mmio port id : 0
  mmio port 1 : 
    mmio port name (sending port) : pearl_bp_pearl_s2_lsu_mmo
    mmio port id : 1
  mmio port id width : 1

  sequencer : pearl_dflt_SEQ
    sequencer port name : pearl_dflt_SEQ_seq_ip
    sequencer port data width : 32
    sequencer port address width : 16
    sequencer port connects to LSU port : pearl_bp_config_pmem_conf_pmem_seq_ip

number of instruction bits : 61
instruction encoding : 
  opcode value for slot 0 ('pearl_bp_pearl_s1') is 63 (invalid) encoded in instruction bits : 60, 59, 58, 57, 56, 55
  opcode value for slot 1 ('pearl_bp_pearl_s2') is 63 (invalid) encoded in instruction bits : 54, 53, 52, 51, 50, 49
  result port select value for bus 0 ('pearl_bp_pearl_s2_op1_BUS') is 0 (invalid) encoded in instruction bits : 
  result port select value for bus 1 ('pearl_bp_pearl_s2_op0_BUS') is 0 (invalid) encoded in instruction bits : 
  result port select value for bus 2 ('pearl_bp_pearl_s1_sr_BUS') is 0 (invalid) encoded in instruction bits : 
  result port select value for bus 3 ('pearl_bp_pearl_s1_pc_BUS') is 0 (invalid) encoded in instruction bits : 
  result port select value for bus 4 ('pearl_bp_pearl_s1_op0_BUS') is 0 (invalid) encoded in instruction bits : 
  bus select value for write port 0 of register file 0 ('pearl_bp_pearl_rf1_ip0') is 3 (invalid) encoded in instruction bits : 48, 47
  bus select value for write port 0 of register file 1 ('pearl_bp_pearl_rf2_ip0') is 3 (invalid) encoded in instruction bits : 46, 45
  bus select value for write port 1 of register file 1 ('pearl_bp_pearl_rf2_ip1') is 3 (invalid) encoded in instruction bits : 44, 43
  bus select value for write port 0 of register file 2 ('pearl_bp_pearl_pc_wp') is 1 (invalid) encoded in instruction bits : 42
  bus select value for write port 0 of register file 3 ('pearl_bp_pearl_sr_wp') is 0 (invalid) encoded in instruction bits : 
  register index value for write port 0 of register file 0 ('pearl_bp_pearl_rf1_ip0') is 15 (invalid) encoded in instruction bits : 41, 40, 39, 38
  register index value for write port 0 of register file 1 ('pearl_bp_pearl_rf2_ip0') is 15 (invalid) encoded in instruction bits : 37, 36, 35, 34
  register index value for write port 1 of register file 1 ('pearl_bp_pearl_rf2_ip1') is 15 (invalid) encoded in instruction bits : 33, 32, 31, 30
  register index value for write port 0 of register file 2 ('pearl_bp_pearl_pc_wp') is 0 (invalid) encoded in instruction bits : 
  register index value for write port 0 of register file 3 ('pearl_bp_pearl_sr_wp') is 0 (invalid) encoded in instruction bits : 
  register index value for read port 0 of register file 0 ('pearl_bp_pearl_rf1_op0') is 15 (invalid) encoded in instruction bits : 29, 28, 27, 26
  register index value for read port 1 of register file 0 ('pearl_bp_pearl_rf1_op1') is 15 (invalid) encoded in instruction bits : 25, 24, 23, 22
  register index value for read port 0 of register file 1 ('pearl_bp_pearl_rf2_op0') is 15 (invalid) encoded in instruction bits : 21, 20, 19, 18
  register index value for read port 1 of register file 1 ('pearl_bp_pearl_rf2_op1') is 15 (invalid) encoded in instruction bits : 17, 16, 15, 14
  register index value for read port 2 of register file 1 ('pearl_bp_pearl_rf2_op2') is 15 (invalid) encoded in instruction bits : 13, 12, 11, 10
  register index value for read port 0 of register file 2 ('pearl_bp_pearl_pc_rp') is 0 (invalid) encoded in instruction bits : 
  register index value for read port 0 of register file 3 ('pearl_bp_pearl_sr_rp') is 0 (invalid) encoded in instruction bits : 
  immediate data value for slot 0 ('pearl_bp_pearl_s1') is 8191 (invalid) encoded in instruction bits : 29, 28, 27, 26, 9, 8, 7, 6, 5, 4, 3, 2, 1
  immediate data value for slot 1 ('pearl_bp_pearl_s2') is 31 (invalid) encoded in instruction bits : 21, 20, 19, 18, 0


*** summary for 'pearl_processor_pearl' ***

total number of issue slots    : 2
total number of register files : 4
total number of function units : 13
total of 61 instruction bits composed of : 
    number of opcode bits for slot 'pearl_bp_pearl_s1' : 6
    number of opcode bits for slot 'pearl_bp_pearl_s2' : 6
    number of result port select bits for bus 'pearl_bp_pearl_s2_op1_BUS' : 0
    number of result port select bits for bus 'pearl_bp_pearl_s2_op0_BUS' : 0
    number of result port select bits for bus 'pearl_bp_pearl_s1_sr_BUS' : 0
    number of result port select bits for bus 'pearl_bp_pearl_s1_pc_BUS' : 0
    number of result port select bits for bus 'pearl_bp_pearl_s1_op0_BUS' : 0
    number of bus select bits for write port 'pearl_bp_pearl_rf1_ip0' : 2
    number of bus select bits for write port 'pearl_bp_pearl_rf2_ip0' : 2
    number of bus select bits for write port 'pearl_bp_pearl_rf2_ip1' : 2
    number of bus select bits for write port 'pearl_bp_pearl_pc_wp' : 1
    number of bus select bits for write port 'pearl_bp_pearl_sr_wp' : 0
    number of register index bits for write port 'pearl_bp_pearl_rf1_ip0' : 4
    number of register index bits for write port 'pearl_bp_pearl_rf2_ip0' : 4
    number of register index bits for write port 'pearl_bp_pearl_rf2_ip1' : 4
    number of register index bits for write port 'pearl_bp_pearl_pc_wp' : 0
    number of register index bits for write port 'pearl_bp_pearl_sr_wp' : 0
    number of register index bits for read port 'pearl_bp_pearl_rf1_op0' : 4
    number of register index bits for read port 'pearl_bp_pearl_rf1_op1' : 4
    number of register index bits for read port 'pearl_bp_pearl_rf2_op0' : 4
    number of register index bits for read port 'pearl_bp_pearl_rf2_op1' : 4
    number of register index bits for read port 'pearl_bp_pearl_rf2_op2' : 4
    number of register index bits for read port 'pearl_bp_pearl_pc_rp' : 0
    number of register index bits for read port 'pearl_bp_pearl_sr_rp' : 0
    number of immediate data bits for slot 'pearl_bp_pearl_s1' : 13
     Overlayable ports:
       Name = pearl_bp_pearl_rf1_op0
         Maximum overlay width = 4
         Minimum bit position = 0
         Actual number of overlayed bits = 4
       Name = pearl_bp_pearl_pc_rp
         Maximum overlay width = 0
         Minimum bit position = 0
         Actual number of overlayed bits = 0
       Name = pearl_bp_pearl_sr_rp
         Maximum overlay width = 0
         Minimum bit position = 0
         Actual number of overlayed bits = 0
    -> 9 excess bits
    number of immediate data bits for slot 'pearl_bp_pearl_s2' : 5
     Overlayable ports:
       Name = pearl_bp_pearl_rf2_op0
         Maximum overlay width = 4
         Minimum bit position = 0
         Actual number of overlayed bits = 4
    -> 1 excess bits
total number of mmio ports : 2
  mmio port 0 connects to fu 'pearl_bp_pearl_s1_sru' in slot 'pearl_bp_pearl_s1' (3 address bits, 32 data bits)
  mmio port 1 connects to fu 'pearl_bp_pearl_s2_lsu' in slot 'pearl_bp_pearl_s2' (16 address bits, 32 data bits)

=== Logical Memory (LM) 0 specification ===================================================

name of lm : pearl_bp_config_pmem_conf_pmem

lowest user status & control register     : 9
number of user status & control registers : 0

number of lsu ports : 1
  lsu port 0 : 
    name : pearl_bp_config_pmem_conf_pmem_seq_ip
    id : 0
    data width : 32
    address width : 16
    info width      : 0
    connects to master routing network source : pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_ip0

number of master ports : 0
number of slave ports : 2
  slave port 0 : 
    name : pearl_bp_config_pmem_conf_pmem_sl_ip_config
    id : 0
    data width : 32
    address width : 6
    info width      : 0
    connects to slave routing network sink : pearl_single_SRN_op0
  slave port 1 : 
    name : pearl_bp_config_pmem_conf_pmem_sl_ip_pmem
    id : 1
    data width : 32
    address width : 16
    info width      : 0
    connects to slave routing network sink : pearl_single_SRN_op1
number of stream in ports : 0
number of stream out ports : 0

number of local devices : 2
  local device 0 : 
    name          : pearl_bp_config_pmem_conf_pmem_stat_ctrl
    id            : 0
    kind          : 6
    data width    : 32
    capacity      : 9 => addressable range requires 6 address bits
    address width : 6
    latency       : 1
    number of user properties : 0
    number of CoreIO ports : 1
      port 0 : 
        name       : pearl_bp_config_pmem_conf_pmem_stat_ctrl_wp
        id         : 0
        data width : 32
        address width : 6
        info width      : 0
        connects to LM slave port : pearl_bp_config_pmem_conf_pmem_sl_ip_config
    number of Cell ports : 0
  local device 1 : 
    name          : pearl_bp_config_pmem_conf_pmem_pmem
    id            : 1
    kind          : 4
    data width    : 128
    capacity      : 4096 => addressable range requires 16 address bits
    address width : 16
    latency       : 1
    number of user properties : 0
    number of CoreIO ports : 1
      port 0 : 
        name       : pearl_bp_config_pmem_conf_pmem_pmem_wp
        id         : 0
        data width : 32
        address width : 16
        info width      : 0
        connects to resource port : Arb_pearl_bp_config_pmem_conf_pmem_pmem_wp_op
    number of Cell ports : 0

number of arbiters : 1
  arbiter 0 : 
    name          : Arb_pearl_bp_config_pmem_conf_pmem_pmem_wp
    id            : 0
    number of contender ports : 2
      contender port 0 : 
        name       : Arb_pearl_bp_config_pmem_conf_pmem_sl_ip_pmem
        id         : 0
        data width : 32
        address width : 16
        info width      : 0
        core contender : 0
        connects to LM slave port : pearl_bp_config_pmem_conf_pmem_sl_ip_pmem
      contender port 1 : 
        name       : Arb_pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_op0
        id         : 1
        data width : 32
        address width : 16
        info width      : 0
        core contender : 1
        connects to master routing network sink : pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_op0
      contender group 0 : 
        name       : Arb_pearl_bp_config_pmem_conf_pmem_pmem_wp_group_core
        id         : 0
        number of members : 1
          name : Arb_pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_op0
      contender group 1 : 
        name       : Arb_pearl_bp_config_pmem_conf_pmem_pmem_wp_group_sl_ip_pmem
        id         : 1
        number of members : 1
          name : Arb_pearl_bp_config_pmem_conf_pmem_sl_ip_pmem
    number of resource ports : 1
      port 0: 
        name       : Arb_pearl_bp_config_pmem_conf_pmem_pmem_wp_op
        id         : 0
        data width : 32
        address width : 16
        info width      : 0
        connects to coreIO port : pearl_bp_config_pmem_conf_pmem_pmem_wp

number of caches : 0

master routing network : pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0
  number of sources : 1
    source 0 : 
      name    : pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_ip0
      id      : 0
      data width : 32
      address width : 16
      info width      : 0
      receives data from mmio send port : 
      fan out : 1
      can connect to sinks : 
        pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_op0
      for sink selection uses code derived from address bits : 15 downto 16
        code 0 selects (i.e. addresses          0 ...       ffff map to) : pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_op0
      number of possible mapping codes : 1
  number of sinks   : 1
    sink 0 : 
      name            : pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_op0
      id              : 0
      data width      : 32
      address width   : 16
      info width      : 0
      minimum map code used to select this sink : 0
      connects to device CoreIO port : pearl_bp_config_pmem_conf_pmem_pmem_wp
      controlled by source : pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_ip0


=== Logical Memory (LM) 1 specification ===================================================

name of lm : pearl_bp_fifo_fifo

lowest user status & control register     : 9
number of user status & control registers : 0

number of lsu ports : 1
  lsu port 0 : 
    name : pearl_bp_fifo_fifo_core_ip
    id : 0
    data width : 32
    address width : 3
    info width      : 0
    connects to master routing network source : pearl_bp_fifo_fifo_loc_mt_am_inst_1_ip0

number of master ports : 0
number of slave ports : 0
number of stream in ports : 2
  stream in port 0 : 
    name : pearl_bp_fifo_fifo_st_ip0
    id : 0
    data width : 32
    connects to cell stream in port : pearl_st_ip0
  stream in port 1 : 
    name : pearl_bp_fifo_fifo_st_ip1
    id : 1
    data width : 32
    connects to cell stream in port : pearl_st_ip1
number of stream out ports : 2
  stream out port 0 : 
    name : pearl_bp_fifo_fifo_st_op0
    id : 0
    data width : 32
    connects to cell stream out port : pearl_st_op0
  stream out port 1 : 
    name : pearl_bp_fifo_fifo_st_op1
    id : 1
    data width : 32
    connects to cell stream out port : pearl_st_op1

number of local devices : 2
  local device 0 : 
    name          : pearl_bp_fifo_fifo_fifo0
    id            : 0
    kind          : 0
    data width    : 32
    capacity      : 2 => addressable range requires 3 address bits
    address width : 3
    latency       : 0
    number of user properties : 0
    number of CoreIO ports : 1
      port 0 : 
        name       : pearl_bp_fifo_fifo_fifo0_ip0
        id         : 0
        data width : 32
        address width : 2
        info width      : 0
        connects to master routing network sink : pearl_bp_fifo_fifo_loc_mt_am_inst_1_op0
    number of Cell ports : 2
      port 0 : 
        name       : pearl_bp_fifo_fifo_fifo0_ip1
        id         : 0
        data width : 32
        address width : 2
        info width      : 0
        connects to LM stream in port : pearl_bp_fifo_fifo_st_ip0
      port 1 : 
        name       : pearl_bp_fifo_fifo_fifo0_op0
        id         : 1
        data width : 32
        address width : 1
        info width      : 0
        connects to LM stream out port : pearl_bp_fifo_fifo_st_op0
  local device 1 : 
    name          : pearl_bp_fifo_fifo_fifo1
    id            : 1
    kind          : 0
    data width    : 32
    capacity      : 2 => addressable range requires 3 address bits
    address width : 3
    latency       : 0
    number of user properties : 0
    number of CoreIO ports : 1
      port 0 : 
        name       : pearl_bp_fifo_fifo_fifo1_ip0
        id         : 0
        data width : 32
        address width : 2
        info width      : 0
        connects to master routing network sink : pearl_bp_fifo_fifo_loc_mt_am_inst_1_op1
    number of Cell ports : 2
      port 0 : 
        name       : pearl_bp_fifo_fifo_fifo1_ip1
        id         : 0
        data width : 32
        address width : 2
        info width      : 0
        connects to LM stream in port : pearl_bp_fifo_fifo_st_ip1
      port 1 : 
        name       : pearl_bp_fifo_fifo_fifo1_op0
        id         : 1
        data width : 32
        address width : 1
        info width      : 0
        connects to LM stream out port : pearl_bp_fifo_fifo_st_op1

number of arbiters : 0

number of caches : 0

master routing network : pearl_bp_fifo_fifo_loc_mt_am_inst_1
  number of sources : 1
    source 0 : 
      name    : pearl_bp_fifo_fifo_loc_mt_am_inst_1_ip0
      id      : 0
      data width : 32
      address width : 3
      info width      : 0
      receives data from mmio send port : pearl_bp_pearl_s1_sru_mmo
      fan out : 2
      can connect to sinks : 
        pearl_bp_fifo_fifo_loc_mt_am_inst_1_op0
        pearl_bp_fifo_fifo_loc_mt_am_inst_1_op1
      for sink selection uses code derived from address bits : 2 downto 2
        code 0 selects (i.e. addresses          0 ...          3 map to) : pearl_bp_fifo_fifo_loc_mt_am_inst_1_op0
        code 1 selects (i.e. addresses          4 ...          7 map to) : pearl_bp_fifo_fifo_loc_mt_am_inst_1_op1
      number of possible mapping codes : 2
  number of sinks   : 2
    sink 0 : 
      name            : pearl_bp_fifo_fifo_loc_mt_am_inst_1_op0
      id              : 0
      data width      : 32
      address width   : 2
      info width      : 0
      minimum map code used to select this sink : 0
      connects to device CoreIO port : pearl_bp_fifo_fifo_fifo0_ip0
      controlled by source : pearl_bp_fifo_fifo_loc_mt_am_inst_1_ip0
    sink 1 : 
      name            : pearl_bp_fifo_fifo_loc_mt_am_inst_1_op1
      id              : 1
      data width      : 32
      address width   : 2
      info width      : 0
      minimum map code used to select this sink : 1
      connects to device CoreIO port : pearl_bp_fifo_fifo_fifo1_ip0
      controlled by source : pearl_bp_fifo_fifo_loc_mt_am_inst_1_ip0


=== Logical Memory (LM) 2 specification ===================================================

name of lm : pearl_bp_dmem_mem

lowest user status & control register     : 9
number of user status & control registers : 0

number of lsu ports : 1
  lsu port 0 : 
    name : pearl_bp_dmem_mem_core_ip
    id : 0
    data width : 32
    address width : 16
    info width      : 0
    connects to master routing network source : pearl_bp_dmem_mem_loc_mt_am_inst_2_ip0

number of master ports : 0
number of slave ports : 1
  slave port 0 : 
    name : pearl_bp_dmem_mem_sl_ip
    id : 0
    data width : 32
    address width : 16
    info width      : 0
    connects to slave routing network sink : pearl_single_SRN_op2
number of stream in ports : 0
number of stream out ports : 0

number of local devices : 1
  local device 0 : 
    name          : pearl_bp_dmem_mem_mem
    id            : 0
    kind          : 1
    data width    : 32
    capacity      : 16384 => addressable range requires 16 address bits
    address width : 16
    latency       : 1
    bank kind     : 2
    number of user properties : 0
    number of CoreIO ports : 1
      port 0 : 
        name       : pearl_bp_dmem_mem_mem_wp
        id         : 0
        data width : 32
        address width : 16
        info width      : 0
        connects to resource port : Arb_pearl_bp_dmem_mem_mem_wp_op
    number of Cell ports : 0

number of arbiters : 1
  arbiter 0 : 
    name          : Arb_pearl_bp_dmem_mem_mem_wp
    id            : 0
    number of contender ports : 2
      contender port 0 : 
        name       : Arb_pearl_bp_dmem_mem_sl_ip
        id         : 0
        data width : 32
        address width : 16
        info width      : 0
        core contender : 0
        connects to LM slave port : pearl_bp_dmem_mem_sl_ip
      contender port 1 : 
        name       : Arb_pearl_bp_dmem_mem_loc_mt_am_inst_2_op0
        id         : 1
        data width : 32
        address width : 16
        info width      : 0
        core contender : 1
        connects to master routing network sink : pearl_bp_dmem_mem_loc_mt_am_inst_2_op0
      contender group 0 : 
        name       : Arb_pearl_bp_dmem_mem_mem_wp_group_core
        id         : 0
        number of members : 1
          name : Arb_pearl_bp_dmem_mem_loc_mt_am_inst_2_op0
      contender group 1 : 
        name       : Arb_pearl_bp_dmem_mem_mem_wp_group_sl_ip
        id         : 1
        number of members : 1
          name : Arb_pearl_bp_dmem_mem_sl_ip
    number of resource ports : 1
      port 0: 
        name       : Arb_pearl_bp_dmem_mem_mem_wp_op
        id         : 0
        data width : 32
        address width : 16
        info width      : 0
        connects to coreIO port : pearl_bp_dmem_mem_mem_wp

number of caches : 0

master routing network : pearl_bp_dmem_mem_loc_mt_am_inst_2
  number of sources : 1
    source 0 : 
      name    : pearl_bp_dmem_mem_loc_mt_am_inst_2_ip0
      id      : 0
      data width : 32
      address width : 16
      info width      : 0
      receives data from mmio send port : pearl_bp_pearl_s2_lsu_mmo
      fan out : 1
      can connect to sinks : 
        pearl_bp_dmem_mem_loc_mt_am_inst_2_op0
      for sink selection uses code derived from address bits : 15 downto 16
        code 0 selects (i.e. addresses          0 ...       ffff map to) : pearl_bp_dmem_mem_loc_mt_am_inst_2_op0
      number of possible mapping codes : 1
  number of sinks   : 1
    sink 0 : 
      name            : pearl_bp_dmem_mem_loc_mt_am_inst_2_op0
      id              : 0
      data width      : 32
      address width   : 16
      info width      : 0
      minimum map code used to select this sink : 0
      connects to device CoreIO port : pearl_bp_dmem_mem_mem_wp
      controlled by source : pearl_bp_dmem_mem_loc_mt_am_inst_2_ip0


=== Status & control specification ===================================================
Number of registers: 9
  sc_reg_id 0 data width: 27
  sc_reg_id 1 data width: 12
  sc_reg_id 2 data width: 12
  sc_reg_id 3 data width: 0
  sc_reg_id 4 data width: 1
  sc_reg_id 5 data width: 12
  sc_reg_id 6 data width: 4
  sc_reg_id 7 data width: 1
  sc_reg_id 8 data width: 1
Start address register: 1
Break address register: 2
Reset flag:              sc_reg_id = 0, bit 0
Start flag:              sc_reg_id = 0, bit 1
Break flag:              sc_reg_id = 0, bit 2
Run flag:                sc_reg_id = 0, bit 3
Broken flag:             sc_reg_id = 0, bit 4
Ready flag:              sc_reg_id = 0, bit 5
Sleeping flag:           sc_reg_id = 0, bit 6
Stalling flag:           sc_reg_id = 0, bit 7
IRQ clear flag:          sc_reg_id = 0, bit 8
Broken IRQ mask flag:    sc_reg_id = 0, bit 9
Ready IRQ mask flag:     sc_reg_id = 0, bit 10
Sleeping IRQ mask flag:  sc_reg_id = 0, bit 11
Debug step flag:         sc_reg_id = 4, bit 0
Debug PC register:       sc_reg_id = 5
Logical memory: pearl_bp_config_pmem_conf_pmem
  MSink stalling flags
    MSink 0: sc_reg 6, bit 0
  Arbiter: Arb_pearl_bp_config_pmem_conf_pmem_pmem_wp
    Period bit range: 
    Contender port: Arb_pearl_bp_config_pmem_conf_pmem_sl_ip_pmem
      Bandwidth bit range: 
    Contender port: Arb_pearl_bp_config_pmem_conf_pmem_loc_mt_am_inst_0_op0
      Bandwidth bit range: 
Logical memory: pearl_bp_fifo_fifo
  MSink stalling flags
    MSink 0: sc_reg 6, bit 1
    MSink 1: sc_reg 6, bit 2
Logical memory: pearl_bp_dmem_mem
  MSink stalling flags
    MSink 0: sc_reg 6, bit 3
  Arbiter: Arb_pearl_bp_dmem_mem_mem_wp
    Period bit range: sc_reg 0, bits 12..16
    Contender port: Arb_pearl_bp_dmem_mem_sl_ip
      Bandwidth bit range: sc_reg 0, bits 17..21
    Contender port: Arb_pearl_bp_dmem_mem_loc_mt_am_inst_2_op0
      Bandwidth bit range: sc_reg 0, bits 22..26
Loop cache invalidate flag : sc_reg_id = 7, bit 0
Pmem slave access flag     : sc_reg_id = 8, bit 0

slave routing network : pearl_single_SRN
  number of sources : 1
    source 0 : 
      name : pearl_single_SRN_sl_ip
      id   : 0
      data width : 32
      address width : 18
      info width      : 0
      id   : 0
      fan out : 3
      can connect to sinks : 
        pearl_single_SRN_op0
        pearl_single_SRN_op1
        pearl_single_SRN_op2
      for sink selection uses code derived from address bits : 17 downto 16
        code 0 selects (i.e. addresses          0 ...       ffff map to) : pearl_single_SRN_op0
        code 1 selects (i.e. addresses      10000 ...      1ffff map to) : pearl_single_SRN_op1
        code 2 selects (i.e. addresses      20000 ...      2ffff map to) : pearl_single_SRN_op2
        code 3 selects (i.e. addresses      30000 ...      3ffff map to) : 
      number of possible mapping codes : 4
  number of sinks   : 3
    sink 0 : 
      name            : pearl_single_SRN_op0
      id              : 0
      data width      : 32
      address width   : 6
      info width      : 0
      minimum map code used to select this sink : 0
      connects to LM slave port : pearl_bp_config_pmem_conf_pmem_sl_ip_config
      controlled by source : pearl_single_SRN_sl_ip
    sink 1 : 
      name            : pearl_single_SRN_op1
      id              : 1
      data width      : 32
      address width   : 16
      info width      : 0
      minimum map code used to select this sink : 1
      connects to LM slave port : pearl_bp_config_pmem_conf_pmem_sl_ip_pmem
      controlled by source : pearl_single_SRN_sl_ip
    sink 2 : 
      name            : pearl_single_SRN_op2
      id              : 2
      data width      : 32
      address width   : 16
      info width      : 0
      minimum map code used to select this sink : 2
      connects to LM slave port : pearl_bp_dmem_mem_sl_ip
      controlled by source : pearl_single_SRN_sl_ip

