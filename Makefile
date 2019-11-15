# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ncolomer <ncolomer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/15 14:54:43 by ncolomer          #+#    #+#              #
#    Updated: 2019/11/15 16:24:59 by ncolomer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS	=	fib.asm
OBJS	=	$(SRCS:.asm=.o)

NA		=	nasm
NA_FLAGS=	-f macho64
FLAGS 	=	-macosx_version_min 10.7.0 -lSystem
NAME	=	libasm

%.o:			%.asm
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

start:			$(NAME)
				./$(NAME)

$(NAME):		$(OBJS)
				ld $(FLAGS) -o $(NAME) $(OBJS)

clean:
				rm -rf $(OBJS)

fclean:			clean
				rm -rf $(NAME)

re:				fclean $(NAME)

.PHONY:			clean fclean re