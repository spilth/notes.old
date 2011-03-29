# R

## Basics

### Create a vector of numbers

	ages <- c(10,20,30,40)

### Create a vector of strings

	firstNames <- c("John", "Mary", "Bill", "Steve")

### Create vector of consecutive numbers

	years <- 1975:2010

### View the value of variable

	ages

### Get the first value in a vector

	ages[1]

### Get the number of items in a vector

	length(ages)

### Get items 2 through 4 of a vector

	ages[2:4]

### Add number to all values in vector

	ages + 5

### Multiple all values in vector by number

	ages = ages * 2

### Sum the elements in a vector

	sum(ages)

### Cumulative sum of elements in a vector

	cumsum(ages)

### Find the maximum value in a vector

	min(ages)

### Find the maximum value in a vector

	max(ages)

### Sort values in a vector

	sort(ages)

### Get the average/mean of a vector of numbers

	mean(numbers)

### Reverse Sort values in a vector

	sort(ages, decreasing=TRUE)

### Determine if the values in a vector meet some criteria

	ages > 20

### Turn boolean results into numbers

	as.numeric(ages > 20)

### Count the number of elements that meet some criteria

	sum(ages < 30)

### Get the indices of elements that meet some criteria

	(1:length(ages))[ages > 20]

### Convert number values to logical values

	as.logical(c(-1,0,1,2))

### See if values in a vector have names

	names(ages)

### Assign a vector as the names for values in another vector

	names(ages) <- firstNames
	names(ages)
	ages

### Reference a value by its name

	ages["Mary"]

### Remove names from vector

	names(ages) <- NULL

### Create a sequence of numbers using a custom interval

	seq(0, 1, length = 11)
	seq(0, 1, by = 0.1)

### Create a sequence of repeating values

	rep(6, 3)

### Combine multiple sequences or repetitions

	rep(c("doo", "bee"), 4)

### Bind equal-length columns together to create a matrix

	age <- c(10,20,30,40)
	weight <- c(60,120,180,140)
	people <- cbind(age, weight)
	people

### Transpose a matrix (flip on axis?)

	t(people)

### Bind and transpose in one step

	people = rbind(age, weight)

### Get dimensions of a matrix

	dim(people)

### Create matrix from single vector, filling by number of rows

	ageWeight <- c(10, 60, 20, 120, 30, 180, 40,140)
	people = matrix(ageWeight, 2)

### Create matrix from single vector, filling by number of columns

	ageWeight <- c(10, 60, 20, 120, 30, 180, 40,140)
	people = matrix(ageWeight, ncol=2, byrow=T)

### Retrieve an element from a matrix (rows, then columns?)

	maryWeight = people[2,2]
	steveWeight = people[2,4]

### Misc

	Make<-c("Honda","Chevrolet","Ford","Eagle","Volkswagen","Buick","Mitsbusihi", "Dodge","Chrysler","Acura")
	Model<-c("Civic","Beretta","Escort","Summit","Jetta","Le Sabre","Galant", "Grand Caravan","New Yorker","Legend")
	Cylinder<-c(rep("V4",5),"V6","V4",rep("V6",3)) 
	Weight<-c(2170,2655,2345,2560,2330,3325,2745,3735,3450,3265) 
	Mileage<-c(33,26,33,33,26,23,25,18,22,20) 
	Type<-c("Sporty","Compact",rep("Small",3),"Large","Compact","Van",rep("Medium",2))

	Car<-data.frame(Make,Model,Cylinder,Weight,Mileage,Type)

??? How is a Frame different from a Matrix?

* A matrix refers to a numeric array of rows and columns. 
* Data frame is an array consisting of columns of various mode (numeric, character, etc). Small to moderate size data frame can be constructed by data.frame() function

### List all columns of one row in a Frame

Car[1,]
