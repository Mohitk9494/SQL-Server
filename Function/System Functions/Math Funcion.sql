--ABS ( numeric_expression ) - ABS stands for absolute and returns, the absolute (positive) number.

Select ABS(-102.45) 

--CEILING ( numeric_expression ) and FLOOR ( numeric_expression )
--CEILING and FLOOR functions accept a numeric expression as a single parameter. CEILING() returns the smallest integer value greater than or 
--equal to the parameter, whereas FLOOR() returns the largest integer less than or equal to the parameter. 

Select CEILING(15.4) -- retrun 16
Select CEILING(-15.9) -- retrun 15

Select FLOOR(14.9) -- retrun 14
Select FLOOR(-14.9) -- retrun -15

--Power(expression, power) - Returns the power value of the specified expression to the specified power.
Select POWER(2,3) -- retrun 8

--SQUARE ( Number ) - Returns the square of the given number.
Select SQUARE(8)

--SQRT ( Number ) - SQRT stands for Square Root. This function returns the square root of the given value.
select SQRT(81) -- retrun 9

--RAND([Seed_Value]) - Returns a random float number between 0 and 1. Rand() function takes an optional seed parameter. 
--When seed value is supplied the RADN() function always returns the same value for the same seed.

Select RAND()
Select RAND(1) -- Always returns the same value

Select Floor((RAND() * 100))

Declare @Counter Int
Set @Counter = 1
While(@Counter <=10)
Begin
	Print floor(rand() * 100)
	Set @Counter = @Counter + 1
end

--ROUND ( numeric_expression , length [ ,function ] ) - Rounds the given numeric expression based on the given length. This function takes 3 parameters. 
--1. Numeric_Expression is the number that we want to round.
--2. Length parameter, specifies the number of the digits that we want to round to. If the length is a positive number, then the rounding is 
--applied for the decimal part, where as if the length is negative, then the rounding is applied to the number before the decimal.
--3. The optional function parameter, is used to indicate rounding or truncation operations. A value of 0, indicates rounding, where as a 
--value of non zero indicates truncation. Default, if not specified is 0.

-- Round to 2 places after (to the right) the decimal point
Select ROUND(850.556, 2) -- Returns 850.560

-- Truncate anything after 2 places, after (to the right) the decimal point
Select ROUND(850.556, 2, 1) -- Returns 850.550

-- Round to 1 place after (to the right) the decimal point
Select ROUND(850.556, 1) -- Returns 850.600

-- Truncate anything after 1 place, after (to the right) the decimal point
Select ROUND(850.556, 1, 1) -- Returns 850.500

-- Round the last 2 places before (to the left) the decimal point
Select ROUND(850.556, -2) -- 900.000

-- Round the last 1 place before (to the left) the decimal point
Select ROUND(850.556, -1) -- 850.000