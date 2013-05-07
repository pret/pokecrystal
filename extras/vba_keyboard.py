# -*- encoding: utf-8 -*-
"""
This file constructs a networkx.DiGraph object called graph, which can be used
to find the shortest path of keypresses on the keyboard to type a word.
"""

import itertools
import networkx

graph = networkx.DiGraph()

graph_data = """
A a select
A B r
A I l
A lower-upper-column-1 u
A J d

B b select
B A l
B C r
B lower-upper-column-2 u
B K d

C c select
C D r
C B l
C lower-upper-column-3 u
C L d

D d select
D E r
D C l
D del-upper-column-1 u
D M d

E e select
E del-upper-column-2 u
E N d
E D l
E F r

F f select
F del-upper-column-3 u
F O d
F E l
F G r

G g select
G end-upper-column-1 u
G P d
G F l
G H r

H h select
H end-upper-column-2 u
H Q d
H G l
H I r

I i select
I end-upper-column-3 u
I R d
I H l
I A r

J j select
J A u
J S d
J R l
J K r

K k select
K B u
K T d
K J l
K L r

L l select
L C u
L U d
L K l
L M r

M m select
M D u
M V d
M L l
M N r

N n select
N E u
N W d
N M l
N O r

O o select
O F u
O X d
O N l
O P r

P p select
P G u
P Y d
P O l
P Q r

Q q select
Q H u
Q Z d
Q P l
Q R r

R r select
R I u
R space-upper-x8-y2 d
R Q l
R J r

S s select
S J u
S - d
S space-upper-x8-y2 l

T t select
T K u
T ? d
T S l
T U r

U u select
U L u
U ! d
U T l
U V r

V v select
V M u
V / d
V U l
V W r

W w select
W N u
W . d
W V l
W X r

X x select
X O u
X , d
X W l
X Y r

Y y select
Y P u
Y space-upper-x6-y3 d
Y X l
Y Z r

Z z select
Z Q u
Z space-upper-x7-y3 d
Z Y l
Z space-upper-x8-y2 r

end-upper-column-1 lower-upper-column-1 r
end-upper-column-2 lower-upper-column-1 r
end-upper-column-3 lower-upper-column-1 r
end-upper-column-1 del-upper-column-1 l
end-upper-column-2 del-upper-column-1 l
end-upper-column-3 del-upper-column-1 l
lower-upper-column-1 end-upper-column-1 l
lower-upper-column-2 end-upper-column-1 l
lower-upper-column-3 end-upper-column-1 l
lower-upper-column-1 del-upper-column-1 r
lower-upper-column-2 del-upper-column-1 r
lower-upper-column-3 del-upper-column-1 r
del-upper-column-1 lower-upper-column-1 l
del-upper-column-2 lower-upper-column-1 l
del-upper-column-3 lower-upper-column-1 l
del-upper-column-1 end-upper-column-1 r
del-upper-column-2 end-upper-column-1 r
del-upper-column-3 end-upper-column-1 r

lower-upper-column-1 A d
lower-upper-column-2 B d
lower-upper-column-3 C d
lower-upper-column-1 - u
lower-upper-column-2 ? u
lower-upper-column-3 ! u

del-upper-column-1 D d
del-upper-column-2 E d
del-upper-column-3 F d
del-upper-column-1 / u
del-upper-column-2 . u
del-upper-column-3 , u

end-upper-column-1 G d
end-upper-column-2 H d
end-upper-column-3 I d
end-upper-column-1 space-upper-x6-y3 u
end-upper-column-2 space-upper-x7-y3 u
end-upper-column-3 space-upper-x8-y3 u

space-upper-x8-y2 space-lower-x8-y2 select
space-upper-x8-y2 R u
space-upper-x8-y2 space-upper-x8-y3 d
space-upper-x8-y2 Z l
space-upper-x8-y2 S r

space-upper-x8-y3 MN select
space-upper-x8-y3 space-upper-x8-y2 u
space-upper-x8-y3 end-upper-column-3 d
space-upper-x8-y3 space-upper-x7-y3 l
space-upper-x8-y3 - r

space-upper-x7-y3 PK select
space-upper-x7-y3 Z u
space-upper-x7-y3 end-upper-column-2 d
space-upper-x7-y3 space-upper-x6-y3 l
space-upper-x7-y3 space-upper-x8-y3 r

space-upper-x6-y3 ] select
space-upper-x6-y3 Y u
space-upper-x6-y3 end-upper-column-1 d
space-upper-x6-y3 , l
space-upper-x6-y3 space-upper-x7-y3 r

end-upper-column-1 end-lower-column-1 select
end-upper-column-2 end-lower-column-2 select
end-upper-column-3 end-lower-column-3 select
lower-upper-column-1 lower-lower-column-1 select
lower-upper-column-2 lower-lower-column-2 select
lower-upper-column-3 lower-lower-column-3 select
del-upper-column-1 del-lower-column-1 select
del-upper-column-2 del-lower-column-2 select
del-upper-column-3 del-lower-column-3 select

lower-lower-column-1 × u
lower-lower-column-2 ( u
lower-lower-column-3 ) u
lower-lower-column-1 a d
lower-lower-column-2 b d
lower-lower-column-3 c d

end-lower-column-1 ] u
end-lower-column-2 PK u
end-lower-column-3 MN u
end-lower-column-1 g d
end-lower-column-2 h d
end-lower-column-3 i d

del-lower-column-1 : u
del-lower-column-2 ; u
del-lower-column-3 [ u
del-lower-column-1 d d
del-lower-column-2 e d
del-lower-column-3 f d

- × select
- S u
- lower-upper-column-1 d
- space-upper-x8-y3 l
- ? r

? ( select
? T u
? lower-upper-column-2 d
? - l
? ! r

! ) select
! U u
! lower-upper-column-3 d
! ? l
! / r

/ : select
/ V u
/ del-upper-column-1 d
/ ! l
/ . r

. ; select
. W u
. del-upper-column-2 d
. / l
. , r

, [ select
, X u
, del-upper-column-3 d
, . l
, space-upper-x6-y3 r

× - select
× s u
× upper-lower-column-1 d
× MN l
× ( r

( ? select
( t u
( upper-lower-column-2 d
( × l
( ) r

) ! select
) u u
) upper-lower-column-3 d
) ( l
) : r

: / select
: v u
: del-lower-column-1 d
: ) l
: ; r

; . select
; w u
; del-lower-column-2 d
; : l
; [ r

[ , select
[ x u
[ del-lower-column-3 d
[ ; l
[ ] r

] space-upper-x6-y3 select
] y u
] end-lower-column-1 d
] [ l
] PK r

PK space-upper-x7-y3 select
PK z u
PK end-lower-column-2 d
PK ] l
PK MN r

MN space-upper-x8-y3 select
MN space-lower-x8-y2 u
MN end-lower-column-3 d
MN PK l
MN × r

space-lower-x8-y2 space-upper-x8-y2 select
space-lower-x8-y2 r u
space-lower-x8-y2 MN d
space-lower-x8-y2 z l
space-lower-x8-y2 s r

a A select
a upper-lower-column-1 u
a j d
a i l
a b r

b B select
b upper-lower-column-2 u
b k d
b a l
b c r

c C select
c upper-lower-column-3 u
c l d
c b l
c d r

d D select
d del-lower-column-1 u
d m d
d c l
d e r

e E select
e del-lower-column-2 u
e n d
e d l
e f r

f F select
f del-lower-column-3 u
f o d
f e l
f g r

g G select
g end-lower-column-1 u
g p d
g f l
g h r

h H select
h end-lower-column-2 u
h q d
h g l
h i r

i I select
i end-lower-column-3 u
i r d
i h l
i a r

j J select
j a u
j s d
j r l
j k r

k K select
k b u
k t d
k j l
k l r

l L select
l c u
l u d
l k l
l m r

m M select
m d u
m v d
m l l
m n r

n N select
n e u
n w d
n m l
n o r

o O select
o f u
o x d
o n l
o p r

p P select
p g u
p y d
p o l
p q r

q Q select
q h u
q z d
q p l
q r r

r R select
r i u
r space-lower-x8-y2 d
r q l
r j r

s S select
s j u
s × d
s space-lower-x8-y2 l
s t r

t T select
t k u
t ( d
t s l
t u r

u U select
u l u
u ) d
u t l
u v r

v V select
v m u
v : d
v u l
v w r

w W select
w n u
w ; d
w v l
w x r

x X select
x o u
x [ d
x w l
x y r

y Y select
y p u
y ] d
y x l
y z r

z Z select
z q u
z PK d
z y l
z space-lower-x8-y2 r"""

for line in graph_data.split("\n"):
    if line == "":
        continue
    elif line[0] == "#":
        continue

    (node1, node2, edge_name) = line.split(" ")
    graph.add_edge(node1, node2, key=edge_name)

    #print "Adding edge ("+edge_name+") "+node1+" -> "+node2

def shortest_path(node1, node2):
    """
    Figures out the shortest list of button presses to move from one letter to
    another.
    """
    buttons = []
    last = None
    path = networkx.shortest_path(graph, node1, node2)
    for each in path:
        if last != None:
            buttons.append(convert_nodes_to_button_press(last, each))
        last = each
    return buttons
    #return [convert_nodes_to_button_press(node3, node4) for (node3, node4) in zip(*(iter(networkx.shortest_path(graph, node1, node2)),) * 2)]

def convert_nodes_to_button_press(node1, node2):
    """
    Determines the button necessary to switch from node1 to node2.
    """
    print "getting button press for state transition: " + node1 + " -> " + node2
    return graph.get_edge_data(node1, node2)["key"]

def plan_typing(text, current="A"):
    """
    Plans a sequence of button presses to spell out the given text.
    """
    buttons = []
    for target in text:
        if target == current:
            buttons.append("a")
        else:
            print "Finding the shortest path between " + current + " and " + target
            more_buttons = shortest_path(current, target)
            buttons.extend(more_buttons)
            buttons.append("a")
            current = target
    return buttons

