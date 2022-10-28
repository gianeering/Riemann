#Author: Gianfranco Ponza, a.k.a GianProgrammer, gianeering, innerRot
#© 2022 Gianfranco Ponza. All rights reserved.

module Riemann
	export f,Subdivision,riemann,subdivide,f_solve
	"""
	WATCH OUT FOR THE DOMAIN OF THE FUNCTION, INTEGRALS (ATLEAST HERE) CAN ONLY BE COMPUTED FOR
	CONTINUOUS FUNCTIONS AND FOR REAL NUMBERS!
	Also, the specified 'var' and the variable you use when writing the function have to MATCH, otherwise it won't work!
	Step 1. Define a function by writing 'func = f(x,from,to,var)'.
	Step 2. Define 'fx = f_solve(func)'.
	Step 3. Define 'subs = subdivide(fx)'
	Step 4. Call 'riemann(subs)'.
	Step 5. Enjoy the result. The outputs I got matched Wolfram, let me know if there
			are issues!
	"""

	struct f
		x::String
		from::Real
		to::Real
		var::Char
		f(x::String,from::Real,to::Real,var::Char)=new(x,from,to,var)
	end

	struct Subdivision
		from::Real
		to::Real
		base::Real
		height::Real
		Subdivision(from::Real,to::Real,base::Real,height::Real)=new(from,to,base,height)
	end

	"""
	riemann function computes the sum of the areas of the subdivisions
	"""
	function riemann(subs::Vector{Subdivision})::Real
		out::Real = 0
		for sub in subs
			out += sub.base * sub.height
		end
		return out
	end

	"""
	subdivide function subdivides into rectangles the area below the curve of the desired function
	"""
	function subdivide(sfunc)
		out::Vector{Subdivision} = []
		x = sort!(collect(keys(sfunc)))
		for i in 2:length(x)
			push!(out,Subdivision(x[i-1],x[i],x[i]-x[i-1],sfunc[x[i]]))
		end
		return out
	end

	"""
	f_solve solves a function by giving it x's and outputting y's
	"""
	function f_solve(func::f,acc::Int64)::Dict
		out::Dict = Dict()
		for x in func.from:1/acc:func.to
			out[x] = eval(Meta.parse(replace(func.x,func.var => x)))
		end
		return out
	end
end
