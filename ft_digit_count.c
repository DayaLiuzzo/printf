/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_digit_count.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dliuzzo <dliuzzo@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/23 11:25:18 by dliuzzo           #+#    #+#             */
/*   Updated: 2023/11/23 11:50:08 by dliuzzo          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_digit_count(int n)
{
	int	digit;

	digit = 0;
	if (n < 0)
	{
		digit++;
		n = -n;
	}
	if (n == 0)
		return (1);
	while (n != 0)
	{
		n /= 10;
		digit++;
	}
	return (digit);
}
