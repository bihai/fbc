# include "fbcu.bi"

namespace fbc_tests.overloads.hex_oct_bin

sub test cdecl( )
	type T
		as integer a, b, c, d
	end type

	dim b as byte = -2 ^ 7
	dim s as short = -2 ^ 15
	dim l as long = -2 ^ 31
	dim ll as longint = -2LL ^ 63
#ifdef __FB_64BIT__
	dim i as integer = ll
#else
	dim i as integer = l
#endif
	dim p as any ptr = cptr( any ptr, i )
	dim pt as T ptr = cptr( T ptr, p )

	CU_ASSERT( bin( b     ) = "10000000" )
	CU_ASSERT( bin( b,  1 ) = "0" )
	CU_ASSERT( bin( b,  8 ) = "10000000" )
	CU_ASSERT( bin( s     ) = "1000000000000000" )
	CU_ASSERT( bin( s,  1 ) = "0" )
	CU_ASSERT( bin( s, 16 ) = "1000000000000000" )
	CU_ASSERT( bin( l     ) = "10000000000000000000000000000000" )
	CU_ASSERT( bin( l,  1 ) = "0" )
	CU_ASSERT( bin( l, 32 ) = "10000000000000000000000000000000" )
	CU_ASSERT( bin( ll     ) = "1000000000000000000000000000000000000000000000000000000000000000" )
	CU_ASSERT( bin( ll,  1 ) = "0" )
	CU_ASSERT( bin( ll, 64 ) = "1000000000000000000000000000000000000000000000000000000000000000" )
#ifdef __FB_64BIT__
	CU_ASSERT( bin( i     ) = "1000000000000000000000000000000000000000000000000000000000000000" )
	CU_ASSERT( bin( i,  1 ) = "0" )
	CU_ASSERT( bin( i, 64 ) = "1000000000000000000000000000000000000000000000000000000000000000" )
	CU_ASSERT( bin( p     ) = "1000000000000000000000000000000000000000000000000000000000000000" )
	CU_ASSERT( bin( p,  1 ) = "0" )
	CU_ASSERT( bin( p, 64 ) = "1000000000000000000000000000000000000000000000000000000000000000" )
	CU_ASSERT( bin( pt     ) = "1000000000000000000000000000000000000000000000000000000000000000" )
	CU_ASSERT( bin( pt,  1 ) = "0" )
	CU_ASSERT( bin( pt, 64 ) = "1000000000000000000000000000000000000000000000000000000000000000" )
#else
	CU_ASSERT( bin( i     ) = "10000000000000000000000000000000" )
	CU_ASSERT( bin( i,  1 ) = "0" )
	CU_ASSERT( bin( i, 32 ) = "10000000000000000000000000000000" )
	CU_ASSERT( bin( p     ) = "10000000000000000000000000000000" )
	CU_ASSERT( bin( p,  1 ) = "0" )
	CU_ASSERT( bin( p, 32 ) = "10000000000000000000000000000000" )
	CU_ASSERT( bin( pt     ) = "10000000000000000000000000000000" )
	CU_ASSERT( bin( pt,  1 ) = "0" )
	CU_ASSERT( bin( pt, 32 ) = "10000000000000000000000000000000" )
#endif

	CU_ASSERT( hex( b     ) = "80" )
	CU_ASSERT( hex( b,  1 ) = "0" )
	CU_ASSERT( hex( b,  2 ) = "80" )
	CU_ASSERT( hex( s     ) = "8000" )
	CU_ASSERT( hex( s,  1 ) = "0" )
	CU_ASSERT( hex( s,  4 ) = "8000" )
	CU_ASSERT( hex( l     ) = "80000000" )
	CU_ASSERT( hex( l,  1 ) = "0" )
	CU_ASSERT( hex( l,  8 ) = "80000000" )
	CU_ASSERT( hex( ll     ) = "8000000000000000" )
	CU_ASSERT( hex( ll,  1 ) = "0" )
	CU_ASSERT( hex( ll, 16 ) = "8000000000000000" )
#ifdef __FB_64BIT__
	CU_ASSERT( hex( i     ) = "8000000000000000" )
	CU_ASSERT( hex( i,  1 ) = "0" )
	CU_ASSERT( hex( i, 16 ) = "8000000000000000" )
	CU_ASSERT( hex( p     ) = "8000000000000000" )
	CU_ASSERT( hex( p,  1 ) = "0" )
	CU_ASSERT( hex( p, 16 ) = "8000000000000000" )
	CU_ASSERT( hex( pt     ) = "8000000000000000" )
	CU_ASSERT( hex( pt,  1 ) = "0" )
	CU_ASSERT( hex( pt, 16 ) = "8000000000000000" )
#else
	CU_ASSERT( hex( i     ) = "80000000" )
	CU_ASSERT( hex( i,  1 ) = "0" )
	CU_ASSERT( hex( i,  8 ) = "80000000" )
	CU_ASSERT( hex( p     ) = "80000000" )
	CU_ASSERT( hex( p,  1 ) = "0" )
	CU_ASSERT( hex( p,  8 ) = "80000000" )
	CU_ASSERT( hex( pt    ) = "80000000" )
	CU_ASSERT( hex( pt, 1 ) = "0" )
	CU_ASSERT( hex( pt, 8 ) = "80000000" )
#endif

	CU_ASSERT( oct( b     ) = "200" )
	CU_ASSERT( oct( b,  1 ) = "0" )
	CU_ASSERT( oct( b,  3 ) = "200" )
	CU_ASSERT( oct( s     ) = "100000" )
	CU_ASSERT( oct( s,  1 ) = "0" )
	CU_ASSERT( oct( s,  6 ) = "100000" )
	CU_ASSERT( oct( l     ) = "20000000000" )
	CU_ASSERT( oct( l,  1 ) = "0" )
	CU_ASSERT( oct( l, 11 ) = "20000000000" )
	CU_ASSERT( oct( ll     ) = "1000000000000000000000" )
	CU_ASSERT( oct( ll,  1 ) = "0" )
	CU_ASSERT( oct( ll, 22 ) = "1000000000000000000000" )
#ifdef __FB_64BIT__
	CU_ASSERT( oct( i     ) = "1000000000000000000000" )
	CU_ASSERT( oct( i,  1 ) = "0" )
	CU_ASSERT( oct( i, 22 ) = "1000000000000000000000" )
	CU_ASSERT( oct( p     ) = "1000000000000000000000" )
	CU_ASSERT( oct( p,  1 ) = "0" )
	CU_ASSERT( oct( p, 22 ) = "1000000000000000000000" )
	CU_ASSERT( oct( pt     ) = "1000000000000000000000" )
	CU_ASSERT( oct( pt,  1 ) = "0" )
	CU_ASSERT( oct( pt, 22 ) = "1000000000000000000000" )
#else
	CU_ASSERT( oct( i     ) = "20000000000" )
	CU_ASSERT( oct( i,  1 ) = "0" )
	CU_ASSERT( oct( i, 11 ) = "20000000000" )
	CU_ASSERT( oct( p     ) = "20000000000" )
	CU_ASSERT( oct( p,  1 ) = "0" )
	CU_ASSERT( oct( p, 11 ) = "20000000000" )
	CU_ASSERT( oct( pt     ) = "20000000000" )
	CU_ASSERT( oct( pt,  1 ) = "0" )
	CU_ASSERT( oct( pt, 11 ) = "20000000000" )
#endif

	''
	'' wstring versions
	''

	CU_ASSERT( wbin( b     ) = wstr( "10000000" ) )
	CU_ASSERT( wbin( b,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( b,  8 ) = wstr( "10000000" ) )
	CU_ASSERT( wbin( s     ) = wstr( "1000000000000000" ) )
	CU_ASSERT( wbin( s,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( s, 16 ) = wstr( "1000000000000000" ) )
	CU_ASSERT( wbin( l     ) = wstr( "10000000000000000000000000000000" ) )
	CU_ASSERT( wbin( l,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( l, 32 ) = wstr( "10000000000000000000000000000000" ) )
	CU_ASSERT( wbin( ll     ) = wstr( "1000000000000000000000000000000000000000000000000000000000000000" ) )
	CU_ASSERT( wbin( ll,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( ll, 64 ) = wstr( "1000000000000000000000000000000000000000000000000000000000000000" ) )
#ifdef __FB_64BIT__
	CU_ASSERT( wbin( i     ) = wstr( "1000000000000000000000000000000000000000000000000000000000000000" ) )
	CU_ASSERT( wbin( i,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( i, 64 ) = wstr( "1000000000000000000000000000000000000000000000000000000000000000" ) )
	CU_ASSERT( wbin( p     ) = wstr( "1000000000000000000000000000000000000000000000000000000000000000" ) )
	CU_ASSERT( wbin( p,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( p, 64 ) = wstr( "1000000000000000000000000000000000000000000000000000000000000000" ) )
	CU_ASSERT( wbin( pt     ) = wstr( "1000000000000000000000000000000000000000000000000000000000000000" ) )
	CU_ASSERT( wbin( pt,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( pt, 64 ) = wstr( "1000000000000000000000000000000000000000000000000000000000000000" ) )
#else
	CU_ASSERT( wbin( i     ) = wstr( "10000000000000000000000000000000" ) )
	CU_ASSERT( wbin( i,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( i, 32 ) = wstr( "10000000000000000000000000000000" ) )
	CU_ASSERT( wbin( p     ) = wstr( "10000000000000000000000000000000" ) )
	CU_ASSERT( wbin( p,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( p, 32 ) = wstr( "10000000000000000000000000000000" ) )
	CU_ASSERT( wbin( pt     ) = wstr( "10000000000000000000000000000000" ) )
	CU_ASSERT( wbin( pt,  1 ) = wstr( "0" ) )
	CU_ASSERT( wbin( pt, 32 ) = wstr( "10000000000000000000000000000000" ) )
#endif

	CU_ASSERT( whex( b     ) = wstr( "80" ) )
	CU_ASSERT( whex( b,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( b,  2 ) = wstr( "80" ) )
	CU_ASSERT( whex( s     ) = wstr( "8000" ) )
	CU_ASSERT( whex( s,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( s,  4 ) = wstr( "8000" ) )
	CU_ASSERT( whex( l     ) = wstr( "80000000" ) )
	CU_ASSERT( whex( l,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( l,  8 ) = wstr( "80000000" ) )
	CU_ASSERT( whex( ll     ) = wstr( "8000000000000000" ) )
	CU_ASSERT( whex( ll,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( ll, 16 ) = wstr( "8000000000000000" ) )
#ifdef __FB_64BIT__
	CU_ASSERT( whex( i     ) = wstr( "8000000000000000" ) )
	CU_ASSERT( whex( i,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( i, 16 ) = wstr( "8000000000000000" ) )
	CU_ASSERT( whex( p     ) = wstr( "8000000000000000" ) )
	CU_ASSERT( whex( p,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( p, 16 ) = wstr( "8000000000000000" ) )
	CU_ASSERT( whex( pt     ) = wstr( "8000000000000000" ) )
	CU_ASSERT( whex( pt,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( pt, 16 ) = wstr( "8000000000000000" ) )
#else
	CU_ASSERT( whex( i     ) = wstr( "80000000" ) )
	CU_ASSERT( whex( i,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( i,  8 ) = wstr( "80000000" ) )
	CU_ASSERT( whex( p     ) = wstr( "80000000" ) )
	CU_ASSERT( whex( p,  1 ) = wstr( "0" ) )
	CU_ASSERT( whex( p,  8 ) = wstr( "80000000" ) )
	CU_ASSERT( whex( pt    ) = wstr( "80000000" ) )
	CU_ASSERT( whex( pt, 1 ) = wstr( "0" ) )
	CU_ASSERT( whex( pt, 8 ) = wstr( "80000000" ) )
#endif

	CU_ASSERT( woct( b     ) = wstr( "200" ) )
	CU_ASSERT( woct( b,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( b,  3 ) = wstr( "200" ) )
	CU_ASSERT( woct( s     ) = wstr( "100000" ) )
	CU_ASSERT( woct( s,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( s,  6 ) = wstr( "100000" ) )
	CU_ASSERT( woct( l     ) = wstr( "20000000000" ) )
	CU_ASSERT( woct( l,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( l, 11 ) = wstr( "20000000000" ) )
	CU_ASSERT( woct( ll     ) = wstr( "1000000000000000000000" ) )
	CU_ASSERT( woct( ll,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( ll, 22 ) = wstr( "1000000000000000000000" ) )
#ifdef __FB_64BIT__
	CU_ASSERT( woct( i     ) = wstr( "1000000000000000000000" ) )
	CU_ASSERT( woct( i,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( i, 22 ) = wstr( "1000000000000000000000" ) )
	CU_ASSERT( woct( p     ) = wstr( "1000000000000000000000" ) )
	CU_ASSERT( woct( p,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( p, 22 ) = wstr( "1000000000000000000000" ) )
	CU_ASSERT( woct( pt     ) = wstr( "1000000000000000000000" ) )
	CU_ASSERT( woct( pt,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( pt, 22 ) = wstr( "1000000000000000000000" ) )
#else
	CU_ASSERT( woct( i     ) = wstr( "20000000000" ) )
	CU_ASSERT( woct( i,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( i, 11 ) = wstr( "20000000000" ) )
	CU_ASSERT( woct( p     ) = wstr( "20000000000" ) )
	CU_ASSERT( woct( p,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( p, 11 ) = wstr( "20000000000" ) )
	CU_ASSERT( woct( pt     ) = wstr( "20000000000" ) )
	CU_ASSERT( woct( pt,  1 ) = wstr( "0" ) )
	CU_ASSERT( woct( pt, 11 ) = wstr( "20000000000" ) )
#endif
end sub

private sub ctor( ) constructor
	fbcu.add_suite( "fbc_tests.overload.hex_oct_bin" )
	fbcu.add_test( "hex/oct/bin test", @test )
end sub

end namespace
