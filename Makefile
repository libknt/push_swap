NAME 		=	push_swap
CC			=	cc
INCLUDE		=	-I ./include
PRINTFDIR	=	ft_printf
PRINTF		=	$(PRINTFDIR)/libftprintf.a
PR		=	$(PRINTF)

SRCS		=	srcs/check_arg/error_check.c \
				srcs/list/list_del.c \
				srcs/list/list.c \
				srcs/make_stack/make_stack.c \
				srcs/operation/stack_a_operation.c \
				srcs/operation/stack_ab_operation.c \
				srcs/operation/stack_b_operation.c \
				srcs/operation/stack_operation.c \
				srcs/sort/min_sort.c \
				srcs/sort/sort_utlis.c \
				srcs/sort/sort.c \
				srcs/utils/coordinate_compression.c \
				srcs/utils/ft_atol.c \
				srcs/utils/utils.c \
				srcs/main.c

OBJDIR   = obj
OBJS  = $(addprefix $(OBJDIR)/, $(SRCS:.c=.o))

all: $(NAME)

$(NAME): $(OBJS) $(PR)
		$(CC) $(INCLUDE) -o $(NAME) $^ $(CFLAGS)

$(OBJDIR)/%.o: %.c
	@mkdir -p $$(dirname $@)
	$(CC) $(INCLUDE) $(CFLAGS) -o $@ -c $<

$(PR):
		$(MAKE) -C $(PRINTFDIR)
printf:
		$(MAKE) -C $(PRINTFDIR)

clean:
		$(MAKE) clean -C $(PRINTFDIR)
		$(RM) -r $(OBJDIR)

fclean: clean
		$(MAKE) fclean -C $(PRINTFDIR)
		$(RM) $(NAME)

re : fclean all

.PHONY:
		all clean fclean re printf

