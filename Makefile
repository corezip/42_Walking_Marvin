# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/30 00:26:22 by jaleman           #+#    #+#              #
#    Updated: 2017/08/30 00:26:22 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

init:
	pip install -r requirements.txt

test:
	nosetests tests
