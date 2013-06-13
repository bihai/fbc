'' AST array index nodes
'' l = index expression; r = var expression
''
'' chng: sep/2004 written [v1ctor]


#include once "fb.bi"
#include once "fbint.bi"
#include once "ir.bi"
#include once "ast.bi"

'':::::
function astNewIDX _
	( _
		byval var_ as ASTNODE ptr, _
		byval idx as ASTNODE ptr, _
		byval dtype as integer, _
		byval subtype as FBSYMBOL ptr _
	) as ASTNODE ptr 

    dim as ASTNODE ptr n = any

	if( dtype = FB_DATATYPE_INVALID ) then
		dtype = astGetFullType( var_ )
		subtype = astGetSubType( var_ )
	end if

	'' alloc new node
	n = astNewNode( AST_NODECLASS_IDX, dtype, subtype )

	n->l = idx
	n->r = var_
	n->sym = var_->sym
	n->idx.mult	= 1
	n->idx.ofs = 0

	function = n

end function

function astLoadIDX( byval n as ASTNODE ptr ) as IRVREG ptr
	dim as ASTNODE ptr var_ = any, idx = any
	dim as IRVREG ptr vidx = any, vr = any
	dim as FBSYMBOL ptr s = any
	dim as integer ofs = any

	var_ = n->r
	if( var_ = NULL ) then
		return NULL
	end if

	idx = n->l
	if( idx <> NULL ) then
		vidx = astLoad( idx )
	else
		vidx = NULL
	end if

	if( ast.doemit ) then
		'' ofs * length + difference (non-base 0 indexes) + offset (UDT's offset)
		s = var_->sym

		symbSetIsAccessed( s )

		ofs = n->idx.ofs
		if( symbGetIsDynamic( s ) = FALSE ) then
			ofs += symbGetArrayDiff( s ) + symbGetOfs( s ) + var_->var_.ofs
		else
			s = NULL
		end if

		if( vidx <> NULL ) then
			'' not a reg already? load
			if( irIsREG( vidx ) = FALSE ) then
				irEmitLOAD( vidx )
			end if

			vr = irAllocVRIDX( astGetDataType( n ), n->subtype, s, ofs, n->idx.mult, vidx )
		else
			vr = irAllocVRVAR( astGetDataType( n ), n->subtype, s, ofs )
		end if

		vr->vector = n->vector
	end if

	astDelNode( idx )
	astDelNode( var_ )

	function = vr
end function
