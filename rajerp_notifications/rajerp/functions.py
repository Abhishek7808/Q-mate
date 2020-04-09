def foolproofTime(date_time):
	# remove unwanted charaters from starting
	n = date_time[0:1]
	on = date_time[0:2]
	ons = date_time[0:3]

	if ons == " on":
		date_time = date_time[3:]

	elif on == "on":
		date_time = date_time[2:]

	elif n == "n":
		date_time = date_time[1:]

	# remove unwanted charaters from end
	s = date_time[-1:]
	sa = date_time[-2:]
	san = date_time[-3:]
	if san == " an":
		date_time = date_time[0:-3]

	elif sa == " a":
		date_time = date_time[0:-2]

	elif s == " ":
		date_time = date_time[0:-1]

	return date_time

