# include "fbcu.bi"



#define foo1(p) #p
#define foo2(p) p##p
#define foo3(p) foo1(foo2 p)
#define foo4(p) foo1(foo2(p))

namespace fbc_tests.macros.recursive

sub recursiveTest cdecl ()

	CU_ASSERT_EQUAL( foo1(foo2(bar)), foo3((bar)) )
	CU_ASSERT_EQUAL( foo1(foo2(bar)), foo4(bar) )

end sub

private sub ctor () constructor

	fbcu.add_suite("fbc_tests.macros.recursive")
	fbcu.add_test("recursiveTest", @recursiveTest)

end sub

end namespace
