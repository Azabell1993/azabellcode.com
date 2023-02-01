#include <stdio.h>
#include <stdint.h>
#include <assert.h>


/*
    asm asm-qualifiers ( AssemblerTemplate 
                    : OutputOperands 
                    [ : InputOperands
                    [ : Clobbers ] ])

    asm asm-qualifiers ( AssemblerTemplate 
                        : OutputOperands
                        : InputOperands
                        : Clobbers
                        : GotoLabels)
*/

/*
    __asm__ __volatile__ (asms : output : input : clobber);
    __asm__
    다음에 나오는 것이 인라인 어셈블리 임을 나타낸다. ANSI엔 __asm__ 으로만 정으되어 있으므로 asm 과 같은 키워드는 사용하지 않는 것이 바람직하다.

    __volatile__
    이 키워드를 사용하면 컴파일러는 프로그래머가 입력한 그래도 남겨두게 된다. 즉 최적화 나 위치를 옮기는 등의 일을 하지 않는다. 예를 들어 output 변수중 하나가 인라인 어셈블리엔 명시되어 있지만 다른 곳에서 사용되지 않는다고 판단되면 컴파일러는 이 변수를 알아서 잘 없애주기도 한다. 이런 경우 이런 것을 고려해 프로그램을 짰다면 상관 없겠지만 만에 하나 컴파일러가 자동으로 해준 일 때문에 버그가 발생할 수도 있다. 그러므로 __volatile__ 키워드를 사용해 주는 것이 좋다.

    asms
    따옴표로 둘러싸인 어셈블리 코드. 코드 내에서는 %x과 같은 형태로 input, output 파라미터를 사용할 수 있으며 컴파일 하면 파라미터가 치환된 대로 어셈블리 코드로 나타난다.

    output
    변수들을 적어 주고 각각은 쉼표고 구분된다. 결과 값을 출력하는 변수를 적는다.

    input
    output과 같은 방식으로 사용하고 인라인 어셈블리 코드에 넘겨주는 파라미터를 적는다.

    clobber
    output, input에 명시되어 있진 않지만 asms를 실행해서 값이 변하는 것을 적어 준다. 각 변수는 쉼표로 구분되고 각각을 따옴표로 감싸준다.

    asms는 반드시 있어야하지만 output, input, clobber는 각각 없을 수도 있다. 만약 clobber가 없는 경우 라면 clobber와 바로 앞의 콜론(:)을 같이 쓰지 않아도 된다. 마찬가지로 input, clobber가 없다면 output까지만 쓰면 된다.

    그러나 output, clobber는 있고 input이 없는 경우엔 다음과 같이 input 만을 제외한 나머지는 반드시 써줘야한다.

    __asm__ __volatile__ (asms : output : : clobber);
    중간에 있는 것이 없는 경우엔 해당 항목만을 없애고 콜론은 그대로 내버려둬야 다음 필드가 어떤 것을 의미하는지 나타내게 된다.
*/

/*
        Modifier	Description	                                                                                                                               |     Operand	|    ‘att’	 |   ‘intel’
    ---------------------------------------------------------------------------------------------------------------------------------------------------------|--------------|------------|---------------
        A	        Print an absolute memory reference.	                                                                                                       |     %A0	    |    *%rax	 |   rax
        b	        Print the QImode name of the register.	                                                                                                   |     %b0	    |    %al	   |       al
        B	        print the opcode suffix of b.		                                                                                                           |     %B0	    |    b	     |   
        c	        Require a constant operand and print the constant expression with no punctuation.	                                                         |     %c1	    |    2	     |   2
        d	        print duplicated register operand for AVX instruction.	%d5	%xmm0, %xmm0	xmm0, xmm0                                                       |              |            |
        E	        Print the address in Double Integer (DImode) mode (8 bytes) when the target is 64-bit. Otherwise mode is unspecified (VOIDmode).	         |     %E1	    |    %(rax)	 |   [rax]
        g	        Print the V16SFmode name of the register.		                                                                                               |     %g0	    |    %zmm0	 |   zmm0
        h	        Print the QImode name for a “high” register.		                                                    	                                     |     %h0	    |    %ah	   |   ah
        H	        Add 8 bytes to an offsettable memory reference. Useful when accessing the high 8 bytes of SSE values. For a memref in (%rax), it generates |     %H0	    |    8(%rax) |	8[rax]
        k	        Print the SImode name of the register.		                                                                                                 |     %k0	    |    %eax	   |   eax
        l	        Print the label name with no punctuation.		                                                                                               |     %l3	    |    .L3	   |   .L3
        L	        print the opcode suffix of l.		                                                                                                           |     %L0	    |    l	     |
        N	        print maskz.		                                                                                                                           |     %N7	    |    {z}	   |   {z}
        p	        Print raw symbol name (without syntax-specific prefixes).		                                                                               |     %p2	    |    42	     |   42
        P	        If used for a function, print the PLT suffix and generate PIC code. For example, emit foo@PLT instead of ’foo’ for the function foo().     |              |            |
                    If used for a constant, drop all syntax-specific prefixes and issue the bare constant. See p above.                                      |              |            |
        q	        Print the DImode name of the register.		                                                                                                 |     %q0 	    |   %rax	   |   rax
        Q	        print the opcode suffix of q.	     	                                                                                                       |     %Q0	    |    q	     |
        R	        print embedded rounding and sae.		                                                                                                       |     %R4	    |    {rn-sae}|	{rn-sae}
        r	        print only sae.		                                                                                                                         |     %r4	    |    {sae}   |	{sae}
        s	        print a shift double count, followed by the assemblers argument delimiterprint the opcode suffix of s.		                                 |     %s1	    |    $2      |    2
        S	        print the opcode suffix of s.		                                                                                                           |     %S0	    |    s	     |
        t	        print the V8SFmode name of the register.		                                                                                               |     %t5	    |    %ymm0	 |   ymm0
        T	        print the opcode suffix of t.		                                                                                                           |     %T0	    |    t	     |
        V	        print naked full integer register name without %.		                                                                                       |     %V0	    |    eax	   |   eax
        w	        Print the HImode name of the register.	                                                                                                   |     %w0	    |    %ax	   |   ax
        W	        print the opcode suffix of w.	                                                                                                             | 	   %W0	    |    w	     |
        x	        print the V4SFmode name of the register.		                                                                                               |     %x5	    |    %xmm0	 |   xmm0
        y	        print "st(0)" instead of "st" as a register.		                                                                                           |     %y6	    |    %st(0)	 |   st(0)
        z	        Print the opcode suffix for the size of the current integer operand (one of b/w/l/q).		                                                   |     %z0	    |    l	     |
*/

void testFunc_1();
void DoCheck();
void do_print();
void do_print_msr();

void testFunc_1() {
    int src;
    int dst;
    asm ("mov %1, %0\n\t"
        "add $105, %0"
        : "=r" (dst) 
        : "r" (src));
    
    printf("testFunc_1 : %d\n", dst);
}

void DoCheck() {
    uint32_t dwSomeValue;

    // dwSomeValue != 0
    uint32_t dwRes;

    asm ("bsfl %1,%0"
      : "=r" (dwRes)
      : "r" (dwSomeValue)
      : "cc");

    assert(dwRes >= 0);
    dwRes = 2;
    printf("DoCheck : %d\n", dwRes);
}

void do_print() {
    uint32_t Mask = 1234;
    uint32_t Index;

    asm ("bsfl %[aMask], %[aIndex]"
        : [aIndex] "=r" (Index)
        : [aMask] "r" (Mask)
        : "cc");

    printf("do_print : %d\n" , Mask);

    uint32_t c = 1128458;
    uint32_t d;
    uint32_t *e = &c;

    asm ("mov %[e], %[d]"
    : [d] "=rm" (d)
    : [e] "rm" (*e));
    printf("do_print pointer : %d\n", *e);
    printf("do_print pointer : %d\n", d);
}

void do_print_msr() {
    uint64_t msr;

    asm volatile ( "rdtsc\n\t"  
            "shl $32, %%rdx\n\t"
            "or %%rdx, %0"      
            : "=a" (msr)
            : 
            : "rdx");
    printf("===================First REsult===================\n");
    printf("msr: %lx\n", msr);
    printf("msr: %ld\n", msr);
}

/*
    특수 형식 문자열
    입력, 출력 및 goto 피연산자에서 설명하는 토큰 외에도 이러한 토큰은 어셈블러 템플릿에서 특별한 의미를 갖는다.

    '%%'
    어셈블러 코드에 단일 '%'를 출력한다.

    '%='
    전체 컴파일에서 asm 문의 각 인스턴스에 고유한 번호를 출력한다. 
    이 옵션은 로컬 레이블을 만들고 여러 어셈블러 명령어를 생성하는 단일 템플릿에서 여러 번 참조할 때 유용하다.

    '%{'
    '%|'
    '%}'
    '{', '|' 및 '}' 문자를 (각각) 어셈블러 코드로 출력한다. 
    이스케이프되지 않은 경우 이러한 문자는 아래 설명된 대로 여러 어셈블러 방언을 나타내는 특별한 의미를 갖는다.
*/

int main() {
    testFunc_1();
    DoCheck();
    do_print();
    do_print_msr();
}

/*
    ARM 제품군에 대한 플래그 출력 제약 조건은 '=@cccond' 형식이다. 
    여기서 cond는 ConditionHolds에 대해 ARM ARM에 정의된 표준 조건 중 하나다.

    eq
    Z flag set, or equal

    ne
    Z flag clear or not equal

    cs
    hs
    C flag set or unsigned greater than equal

    cc
    lo
    C flag clear or unsigned less than

    mi
    N flag set or “minus”

    pl
    N flag clear or “plus”

    vs
    V flag set or signed overflow

    vc
    V flag clear

    hi
    unsigned greater than

    ls
    unsigned less than equal

    ge
    signed greater than equal

    lt
    signed less than

    gt
    signed greater than

    le
    signed less than equal

    The flag output constraints are not supported in thumb1 mode.

    x86 family
    The flag output constraints for the x86 family are of the form ‘=@cccond’ where cond is one of the standard conditions defined in the ISA manual for jcc or setcc.

    a
    “above” or unsigned greater than

    ae
    “above or equal” or unsigned greater than or equal

    b
    “below” or unsigned less than

    be
    “below or equal” or unsigned less than or equal

    c
    carry flag set

    e
    z
    “equal” or zero flag set

    g
    signed greater than

    ge
    signed greater than or equal

    l
    signed less than

    le
    signed less than or equal

    o
    overflow flag set

    p
    parity flag set

    s
    sign flag set

    na
    nae
    nb
    nbe
    nc
    ne
    ng
    nge
    nl
    nle
    no
    np
    ns
    nz
    “not” flag, or inverted versions of those above
*/