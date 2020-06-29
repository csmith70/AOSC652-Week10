#Christopher Smith
#Final Project
#AOSC652
#December 09, 2019

#Import Modules
from mpl_toolkits.basemap import Basemap
import pandas as pd
import LHD
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

#Load data using LHD csv load data function 
data_in = LHD.load_comma_data('https://www.ncdc.noaa.gov/snow-and-ice/daily-snow/MD-snowfall-201601.csv',2)


#Jan24 snowfall data 
snowfall = data_in[:,:]
df = pd.DataFrame(data_in)
#Extract all the rows and the 30th column of data
blizzard = df.iloc[:,29]
print(blizzard)
#print(np.shape(blizzard))
blizzard = np.ma.masked_where(blizzard == 'M', blizzard) #Mask missing value
#print(blizzard[:])
blizzard[np.where(blizzard == 'T')] ='.01'
a = blizzard.compressed().astype(float) #Create an array of float values
print(a)
av = sum(a)/len(a) #Find the average of snowfall on January 24th across MD sites that had data
#print(av)

#Repeat Jan24 above
#Jan23 snowfall data
blizzard01 = df.iloc[:,28]
blizzard01 = np.ma.masked_where(blizzard01 == 'M', blizzard01)
blizzard01[np.where(blizzard01 == 'T')] = '.01'
aa = blizzard01.compressed().astype(float)
av0 = sum(aa)/len(aa)

Total = av+av0
#2 day snowfall total
print('The average 2-day total of snowfall (inches) across observation sites in MD is {0:5.2f}'.format(Total))


#Elevation
elevation = df.iloc[:,3]
#Snow of all MD cities
snow = df.iloc[:,6:]
#print(snow)
snow = np.ma.masked_where(snow == '', snow)
snow[np.where(snow == 'M')] = '.00' #Assigned missing data to 0 to make sure all cities have same length array
snow[np.where(snow == 'T')] = .01
snow = snow.compressed().astype(float)
a = np.reshape(snow, (173,31))
b = np.sum(a, axis = 1, keepdims = True)
#print(a)
#print(b)
#Plot elevation versus snowfall
plt.scatter(elevation,b)
plt.xlabel('Elevation (feet)')
plt.ylabel('Snowfall (inches)')
plt.title('January Snowfall versus Elevation in MD')
plt.show()

#Annapolis 
cap = df.iloc[1,6:]
cap= np.ma.masked_where(cap == '', cap)
cap[np.where(cap == 'M')] = '.00' #Makes no difference for monthly sum of M is masked or filled with 0
cap[np.where(cap == 'T')] = '.01'
cap = cap.compressed().astype(float)
an = sum(cap)
print('The monthly snowfall total (inches) for Annapolis is {0:5.2f}'.format(an))
print(np.shape(cap))


#Baltimore
bwi = df.iloc[4,6:]
bwi = np.ma.masked_where(bwi == '', bwi)
bwi[np.where(bwi == 'M')] = '.00' #Makes no difference for monthly sum of M is masked or filled with 0
bwi[np.where(bwi == 'T')] = '.01'
bwi = bwi.compressed().astype(float)
bal = sum(bwi)
print('The monthly snowfall total (inches) for Baltimore is {0:5.2f}'.format(bal))
rmean2 = []
x = 1
while x < 30:
	total2 = (bwi[x]+bwi[x-1]+bwi[x+1])/3
	rmean2.append(total2)
	x+=1

#College Park (Greenbelt)
cp = df.iloc[65,6:]
cp = np.ma.masked_where(cp == '', cp)
cp[np.where(cp == 'M')] = '.00'#Makes no difference for monthly sum of M is masked or filled with 0
cp[np.where(cp == 'T')] = '.01'
cp = cp.compressed().astype(float)
p = sum(cp)
print('The monthly snowfall total (inches) for College Park is {0:5.2f}'.format(p))

#print(cp)

#Easton
est = df.iloc[45,6:]
est = np.ma.masked_where(est == '', est)
est[np.where(est == 'M')] = '.00'#Makes no difference for monthly sum of M is masked or filled with 0
est[np.where(est == 'T')] = '.01'
est = est.compressed().astype(float)
e = sum(est)
print('The monthly snowfall total (inches) for Easton is {0:5.2f}'.format(e))


#Hagerstown
hg = df.iloc[68,6:]
hg = np.ma.masked_where(hg == '', hg)
hg[np.where(hg == 'M')] = '.00'
hg[np.where(hg == 'T')] = '.01'
hg = hg.compressed().astype(float)
h = sum(hg)
print('The monthly snowfall total (inches) for Hagerstown is {0:5.2f}'.format(h))

#Oakland
oak = df.iloc[101,6:]
#print(oak)
#oak[np.where(oak == 'M')] = '0.0'
oak = np.ma.masked_where(oak == '', oak)
oak[np.where(oak == 'M')] = '.00'#Makes no difference for monthly sum of M is masked or filled with 0
oak = oak.compressed().astype(float)
o = sum(oak)
print('The monthly snowfall total (inches) for Oakland is {0:5.2f}'.format(o))

#Missing data (M) above for College Park, Oakland, and OC needed to be converted to 0 to run running mean of same length for each city
#running mean
rmean = []
x=1
while x < 30:
	total = (oak[x]+oak[x-1]+oak[x+1])/3
	#mean = float(round(total[1], 2))
	rmean.append(total)
	x +=1

#Animation running total Oakland, MD

month = []
grand = 0 
day = 1
while day<31:
	fig=plt.figure(figsize=[9,12])
	snow = oak[day]
	grand = grand + snow
	month.append(grand)
	plt.xlim([1,31])
	plt.ylim([0,50])
	plt.xlabel('January')
	plt.ylabel('Monthly Snowfall Total (inches)')
	plt.title('January Cumulative Snowfall in Oakland, MD')
	plt.plot(month[:day])
	#plt.plot(month[day-1])
	fig.savefig('plot{0:03.0f}.png'.format(day))
	day += 1


#Ocean City: Ocean Pines
oc = df.iloc[103,6:]
#oc[np.where(oc == 'M')] = '0.0'
oc = np.ma.masked_where(oc=='', oc)
oc[np.where(oc == 'M')] = '0.0' #Makes no difference for monthly sum of M is masked or filled with 0
oc = oc.compressed().astype(float)
c = sum(oc)
print('The monthly snowfall total (inches) for Ocean City is {0:5.2f}'.format(c))

rmean1 = []
x=1
while x<30:
	total1 = (oc[x]+oc[x-1]+oc[x+1])/3
	rmean1.append(total1)
	x+=1
xax = np.arange(2,31,1)
plt.plot(xax,rmean,label='Oakland')
plt.plot(xax,rmean1,label='Ocean City')
plt.plot(xax,rmean2, label='BWI')
plt.xlabel('January Data')
plt.ylabel('Snowfall (Inches)')
plt.title('Snowfall in Maryland Cities in January')
plt.legend(loc=0)
plt.show()


#Salisbury
bury = df.iloc[128,6:]
bury = np.ma.masked_where(bury == '', bury)
bury[np.where(bury == 'M')] = '.00' #Makes no difference for monthly sum of M is masked or filled with 0
bury[np.where(bury == 'T')] = '.01'
bury = bury.compressed().astype(float)
s = sum(bury)
print('The monthly snowfall total (inches) for Salisbury is {0:5.2f}'.format(s))

#Print the range in snowfall across Maryland
b = sum(oak) - sum(oc)
print('The range of snowfall totals (inches) across the state from Oakland to OC is {0:5.2f}'.format(b))

#Plot MD cities on a map for snow winners, losers, reference
m = Basemap(llcrnrlon=-85,llcrnrlat=37,urcrnrlon=-72,urcrnrlat=43,
            projection='lcc',resolution='h', lat_1 = 39, lon_0=-78.5)
m.shadedrelief()
px, py = m(-79.40, 39.41) #Oakland: snowiest city!
pm, pb = m(-82, 38) #Oakland label
pa, pb = m(-75.13, 38.37) #Ocean City: Big loser :(
pc, pd = m(-75, 37)
pe, pf = m(-76.94, 38.99)
pg, ph = m(-76.94, 39.9)
plt.plot(pe, pf, marker = '*',markersize=9,color ='black') 
plt.plot(px, py, marker = '*',markersize=9,color ='blue')
plt.plot(pa, pb, marker = '*',markersize=9,color ='red')
plt.text(pm, pb, 'Oakland: Winner', fontsize = 8, fontweight = 'bold', bbox=dict(facecolor='white', edgecolor='black'))
plt.text(pg, ph, 'College Park', fontsize = 6, fontweight = 'bold', bbox=dict(facecolor='white', edgecolor='black'))
plt.text(pc, pd, 'OC: Loser', fontsize = 8, fontweight = 'bold', bbox=dict(facecolor='white', edgecolor='black'))
m.drawstates()
m.drawcountries()
m.drawcoastlines()
m.drawrivers()
plt.title("Maryland's Snowiest and Least Snowy Cities January 2016")
plt.show()








