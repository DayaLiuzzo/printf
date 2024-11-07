PRINTF AT 42;

Walkthrough;

This project aims to give us a better understanding of write system calls and of variadic arguments;
- Variadic arguments def https://en.cppreference.com/w/c/language/variadic
- Write system call http://codewiki.wikidot.com/c:system-calls:write

We will have to emulate the behavior of the printf function from the stdlib;
As a Lazy person i've decided to skipped this project's bonuses.
																													
[Here goes the Mandatory part;]

First let's see what the og girly is doing

when running this code 

![image](https://github.com/user-attachments/assets/04c04e8e-85b1-4a60-b43e-819ff1622729)

we receive this

![image](https://github.com/user-attachments/assets/a484b4c2-efa8-446f-81a3-9079858f90a2)

Our mission will be to get from the first one to the second one, while avoiding the tricks of some edgecases.

![image](https://github.com/user-attachments/assets/428cc0f4-782b-413f-a5ce-5e57b93ad3e5)

To do so we need to get a better understanding of the parameters of the printf function.
if you paid attention you might have seen that the character placeholder %c is later reminded with "character", same goes for every variables)

This process is achieved through the use of Variadic arguments which we addressed vaguely at the beggining, one must be asking themselves,
But how de hell can i predict how many arguments i will be receiving ?
answer is : you dont have to.

![image](https://github.com/user-attachments/assets/26f41d9f-38b3-4e95-bc58-3dbcb27d96f4)

you see these little "..." they are the key of the project.
They basically mean that you can add a number of argument to your function, and this number can ... vary.

AND

printf is ... a variadic function

(because it's parameters may vary)

the syntax is quite transparent;

to DECLARE your variable you write:

	va_list <whatever_name_you_want_but_i_reccomand_args>;

at this stage our va_list args; is a list of all the arguments that were passed in our printf previously;

but how do we access them ?

well to do so you will have to get the "head" of the list with:
				
	va_start(args, format)

args stands for our va_list and format  is the last named argument before the variable arguments start;
we now have our args list in order, all is left to do is analyzing each argument or "node" since we are in a list;

Once the va_list is initialized, you can use va_arg to retrieve the arguments one by one;
Each time you call va_arg, the internal pointer of the va_list (which is keeping track of the current argument) is moved to the next argument in the list.

so for this input

![image](https://github.com/user-attachments/assets/3bdb1f5b-df82-4036-8cee-e1b32f4b20e7)

if you declare and initialize your list properly, once you write

	int  number 
	
	number = va_arg(args, int)

your number will have retrieved the first value of your list.

a little thing to keep in mind is that once you've retrieved a node's value you can no longer access it,
and the next value you will retrieve will be the next value left in the list;

once you are done with your variadic arguments you MUST communicate it to your computer with va_end(args)

and that was it for Variadic arguments overview;
DO NOT HESITATE to double check what you've just read, maybe im Miss information but can't be too safe...

![image](https://github.com/user-attachments/assets/2493dfe3-4053-49b2-b41a-8c68aadde030)

Let's Rewind a bit;

Now that we know how to retrieve the values of these little %c %s %p %d %i %u %x %X %%
we need to display it AND save the amount of digits that we print along the way since printf has a return value that matches her outputs digit count;

you guessed it there's going to be some looping around here

![image](https://github.com/user-attachments/assets/d29daaa3-a67e-451a-9b12-b85c7f171d6a)

now that we are back at the beginning let's make up a situation;
the input is 


	int num = 42;

 	printf("print this int ->%i\n", num);

We need to print everything we meet and save the number of times we made a write system call;
so we can do a little while loop right something cute and neat ?

	ft_printf(const char *format, ...)
	{
		va_list args;
	 	int count;
	
	 	//???//
		va_start(args, format);
		while(*format)
	 	{
	 		//????///
	 		count += write(1, &*format, 1);
		 	///????///
		 format++;
		}
	 	va_end(args);
	 	return(count)
	 }
this would work perfectly fine for 

 	printf("print this int ->42");

but that's not what we have now is it ??

so you will have to find a way to fill these //???// in order to detect when to retrieve and print the variadic arguments;
there are probably a million different ways of achieving this so again double check and try to reallllyyyy
get closer with Variadic arguments, they are nice ppl istg;

and that's a Wrap i hope this was a little bit usefull, take care cya babes 
 		


