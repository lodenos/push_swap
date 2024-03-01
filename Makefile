NAME = push_swap

CC = clang
CFLAGS = -Wall -Wextra -Werror -Weverything -std=gnu18 \
  -Wno-poison-system-directories -Wno-cast-qual

SRC_DIR = ./src
OBJ_DIR = ./obj

SRCS = \
  main.c

OBJS = $(patsubst %.c,%.o,$(SRCS))

INCLUDES = -I ./inc -I ./libft/inc
LIB = -L ./libft -lft

LIBFT = ./libft/libft.a

all: $(NAME) 

$(LIBFT):
	make -C ./libft

$(NAME): $(LIBFT) $(addprefix $(OBJ_DIR)/,$(OBJS))
	$(CC) $(addprefix $(OBJ_DIR)/,$(OBJS)) -o $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D) 
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	make clean -C ./libft
	rm -rf $(OBJ_DIR)

fclean: clean
	make fclean -C ./libft
	rm -f $(NAME)

re: fclean
	make re -C ./libft

.PHONY: all clean fclean re
