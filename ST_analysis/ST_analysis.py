import matplotlib.pyplot as plt

x = ['ST2', 'ST571', 'ST1411', 'ST164', 'ST1412']
y = [6,2,1,1,1]
plt.bar(x,y)
plt.xlabel("Serotype")
plt.ylabel("Frequency")
plt.title("Number of Serotype")
plt.savefig("Serotype.png", dpi = 300)
plt.show()