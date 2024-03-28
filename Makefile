# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dliuzzo <dliuzzo@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/23 11:26:44 by dliuzzo           #+#    #+#              #
#    Updated: 2023/11/23 11:26:45 by dliuzzo          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Werror -Wextra

SRCS = ft_digit_count_hexa.c ft_digit_count.c ft_printf_char.c ft_printf_hexa.c ft_printf_int.c \
ft_printf_ptr.c ft_printf_str.c ft_printf_unsign.c ft_printf.c ft_putchar.c ft_putnbr_hexa.c \
ft_putnbr_unsigned.c ft_putnbr.c

OBJS = $(SRCS:.c=.o)

NAME = libftprintf.a

all: $(NAME)

$(NAME): $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re