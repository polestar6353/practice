import tkinter as tk
import sys

window = tk.Tk()
window.geometry('336x470')
window.resizable(False, False)
window.configure(bg='#0078FF')
text=tk.Entry(window,justify='right',width=40)
text.grid(row=0,columnspan=6,ipady=10,pady=5)
window.title("계산기 1.0")
dotvalue=True
def equal():
    try:
        ca=text.get()
        ca=ca.replace("x","*")
        result=eval(ca)
        text.delete(0, tk.END)
        text.insert('end',result)

    except:
        text.delete(0, tk.END)
        text.insert('end',"올바른 수식을 입력해주세요")



def dot():
    global dotvalue
    if(dotvalue==True):
        text.insert('end','.')
        dotvalue=False


def close():
    sys.exit()

def backspace():
    ca = text.get()
    text.delete(len(ca)-1)

def clear():
    text.delete(0,tk.END)

def show_number(number):
    text.insert('end',number)

def No_Double_Operator(ab):
    getText = text.get()
    global dotvalue
    if(len(getText)!=0):
        if not(getText[len(getText)-1]=="+" or getText[len(getText)-1]=="-" or getText[len(getText)-1]=="x" or getText[len(getText)-1]=="/"):
            text.insert('end', ab)
            dotvalue = True


def sub():
    text.insert('end', "-")
    global dotvalue
    dotvalue = True


#숫자버튼
Btn7=tk.Button(window,text=7,width=10,height=5,command=lambda:show_number(7))
Btn7.grid(row=2,column=0,padx=2,pady=2)
Btn8=tk.Button(window,text=8,width=10,height=5,command=lambda:show_number(8))
Btn8.grid(row=2,column=1,padx=2,pady=2)
Btn9=tk.Button(window,text=9,width=10,height=5,command=lambda:show_number(9))
Btn9.grid(row=2,column=2,padx=2,pady=2)
Btn4=tk.Button(window,text=4,width=10,height=5,command=lambda:show_number(4))
Btn4.grid(row=3,column=0,padx=2,pady=2)
Btn5=tk.Button(window,text=5,width=10,height=5,command=lambda:show_number(5))
Btn5.grid(row=3,column=1,padx=2,pady=2)
Btn6=tk.Button(window,text=6,width=10,height=5,command=lambda:show_number(6))
Btn6.grid(row=3,column=2,padx=2,pady=2)
Btn1=tk.Button(window,text=1,width=10,height=5,command=lambda:show_number(1))
Btn1.grid(row=4,column=0,padx=2,pady=2)
Btn2=tk.Button(window,text=2,width=10,height=5,command=lambda:show_number(2))
Btn2.grid(row=4,column=1,padx=2,pady=2)
Btn3=tk.Button(window,text=3,width=10,height=5,command=lambda:show_number(3))
Btn3.grid(row=4,column=2,padx=2,pady=2)
Btn0=tk.Button(window,text=0,width=10,height=5,command=lambda:show_number(0))
Btn0.grid(row=5,column=0,padx=2,pady=2)


#기타버튼
Btn_close=tk.Button(window,text="종료",width=10,height=3,bg="#0064CD",fg="white",command=lambda:close())
Btn_close.grid(row=1,column=0,padx=2,pady=2)
Btn_clear=tk.Button(window,text="c",width=10,height=3,bg="lightblue",command=lambda:clear())
Btn_clear.grid(row=1,column=1,padx=2,pady=2)
Btn_backspace=tk.Button(window,text="<-",width=22,height=3,bg="lightblue",command=lambda:backspace())
Btn_backspace.grid(row=1,column=2,columnspan=4,padx=2,pady=2)
Btn_add=tk.Button(window,text="+",width=10,height=5,bg="lightblue",command=lambda:No_Double_Operator("+"))
Btn_add.grid(row=2,column=4,padx=2,pady=2)
Btn_sub=tk.Button(window,text="-",width=10,height=5,bg="lightblue",command=lambda:sub())
Btn_sub.grid(row=3,column=4,padx=2,pady=2)
Btn_mul=tk.Button(window,text="x",width=10,height=5,bg="lightblue",command=lambda:No_Double_Operator("x"))
Btn_mul.grid(row=4,column=4,padx=2,pady=2)
Btn_div=tk.Button(window,text="/",width=10,height=5,bg="lightblue",command=lambda:No_Double_Operator("/"))
Btn_div.grid(row=5,column=4,padx=2,pady=2)
Btn_dot=tk.Button(window,text=".",width=10,height=5,command=lambda:dot())
Btn_dot.grid(row=5,column=1,padx=2,pady=2)
Btn_equal=tk.Button(window,text="=",width=10,height=5,bg="lightblue",command=lambda:equal())
Btn_equal.grid(row=5,column=2,padx=2,pady=2)


#키들을 추가로 매핑해보자
def c_clear(event):
    text.delete(0,tk.END)

window.bind('<c>',c_clear)
def Enter_equal(event):
    try:
        ca=text.get()
        ca=ca.replace("x","*")
        result=eval(ca)
        text.delete(0, tk.END)
        text.insert('end',result)

    except:
        text.delete(0, tk.END)
        text.insert('end',"올바른 수식을 입력해주세요")

window.bind('<Return>',Enter_equal)  #엔터키를 입력하면 equal이 작동!




window.mainloop()
