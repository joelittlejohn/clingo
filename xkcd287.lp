#const total = 1505.

quantity(0..7).

menu(mixed_fruit, 215).
menu(french_fries, 275).
menu(side_salad, 335).
menu(hot_wings, 355).
menu(mozzarella_sticks, 420).
menu(samples_plate, 580).

1 {dish_quantity(D, Q) : quantity(Q) } 1 :- menu(D, _).
total [dish_quantity(D, Q) : menu(D, P) : quantity(Q) = Q * P] total.

#hide.
#show dish_quantity/2.
