#------------------------------------#
#               Project              #
#------------------------------------#
NAME		=	libasm.a
PROJDIR		=	$(realpath $(CURDIR))
SRCDIR		=	$(PROJDIR)/srcs
OBJDIR		=	$(PROJDIR)/objs

TESTER_SRC	=	$(PROJDIR)/main.c
TESTER	=	tester

#------------------------------------#
#            Compiler ASM            #
#------------------------------------#
ASM			=	nasm
ASMFLAGS	=	-f elf64 -g -F dwarf

#------------------------------------#
#             Compiler C             #
#------------------------------------#
CC			=	cc
CCFLAGS		=	-Werror -Wextra -Wall 

#------------------------------------#
#              Archiver              #
#------------------------------------#
AR			=	ar
ARFLAGS		=	-rcs

#------------------------------------#
#                Files               #
#------------------------------------#
SRCS		=	$(shell find $(SRCDIR) -type f -name '*'.s)
OBJS		=	$(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SRCS:.s=.o))

#------------------------------------#
#                Rules               #
#------------------------------------#
all : $(NAME)

$(NAME) : $(OBJS)
	@$(AR) $(ARFLAGS) $@ $(OBJS)
	@echo Linking $@

$(OBJDIR)/%.o : $(SRCDIR)/%.s
	@mkdir -p $(dir $@)
	@$(ASM) $(ASMFLAGS) $(INCLUDE) $< -o $@
	@echo Building $(notdir $@)


test: $(NAME) $(TESTER_SRC)
	@$(CC) $(CCFLAGS) -o $(TESTER) $(TESTER_SRC) $(NAME)
	@./$(TESTER)

clean :
	@rm -rf $(OBJDIR)
	@echo Cleaning $(OBJDIR)

fclean : clean
	@rm -f $(NAME)
	@rm -f $(TESTER)
	@echo Cleaning $(NAME) $(TESTER)

re : fclean all

.PHONY : all clean fclean re