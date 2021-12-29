from django.shortcuts import render
from django.db import connection
from django.views.decorators.csrf import csrf_exempt
from .models import Hobby
from django.shortcuts import redirect
from django.core.files.storage import FileSystemStorage
import os

# Create your views here.
def write(request):
  return render(
    request,
    'boardBBS/boardWrite.html',
  )


@csrf_exempt
def board_insert(request):
    try:
        cursor = connection.cursor()

        name = request.POST.get('name')
        title = request.POST.get('title')
        content = request.POST.get('content')
        gender = request.POST.get('gender')
        hobby = request.POST.getlist('hobby')
        upload_f = request.FILES.get('upload_f')

        fs = FileSystemStorage(location='media/images')
        if(upload_f!=None):
          if(os.path.splitext(upload_f.name)[-1] in '.jpg.jpeg.JPG.JPEG.bmp.BMP.png.PNG.gif.GIF'):
            fs.save(upload_f.name,upload_f)
          else:
            upload_f=None


        msg = f"""insert into boardbbs_hobby(name,title,content,gender,hobby,img_file_name) 
                 values('{name}','{title}','{content}','{gender}','{','.join(hobby)}','{upload_f}')"""

        cursor.execute(msg)

        connection.commit()
        connection.close()

    except:
        connection.rollback()
        print("에러가발생했습니다.")


    return redirect('boardList.do')


def index(request):
  return render(
  request,
  'boardBBS/index.html',
)

def board_list(request):
    try:
          cursor = connection.cursor()
       
          lists=[]
          
          pageNum=(request.GET.get('page'))
          if(pageNum==None):
            pageNum=1
          
          skey=request.GET.get('keyfield')
          sval=request.GET.get('keyword')

          pageNum=int(pageNum)


          if(skey==None or skey=="" or sval==None):
            skey="name"
            sval=""
          startPage=pageNum-(pageNum-1)%10
          endPage=startPage+9
          returnpage = "&keyfield="+skey+"&keyword="+sval; 

          startRow=(pageNum-1)*10+1
          endrow=startRow+9

          msg=f"""SELECT * FROM (SELECT @ROWNUM:=@ROWNUM+1 as rn, A.*,(SELECT COUNT(*) from boardbbs_hobbyreply r 
              WHERE r.hobby_idx=A.hobby_idx) as rcnt FROM (SELECT * from boardbbs_hobby where {skey} like '%{sval}%') A, 
              (SELECT @ROWNUM:=0) B) C WHERE rn BETWEEN {startRow} AND {endrow};"""
         
          cursor.execute(msg)
          datas = cursor.fetchall()


          msg="select count(*) from boardbbs_hobby"
          cursor.execute(msg)
          GGtotal = cursor.fetchall()[0][0]
          

          msg=f"""select count(*) from boardbbs_hobby where {skey} like '%{sval}%'"""
          cursor.execute(msg)
          Gtotal = cursor.fetchall()[0][0]


          connection.commit()
          connection.close()
          

          if(GGtotal%10==0): 
            pageCount=Gtotal/10
          else: 
            pageCount=Gtotal/10 +1



          for row in datas:
            data={"rn":round(row[0]),"hobby_idx":row[1],"name":row[2],"title":row[3],"content":row[4],"gender":row[5],"hobby":row[6],"img_file_name":row[7],"rcnt":row[8]}
            lists.append(data)


    except:
          connection.rollback()
          print("에러가발생했습니다.")

    return render(

      request,
      'boardBBS/boardList.html',
      {
        'lists' : lists,
        'startPage' : startPage,
        'endPage' : endPage,
        'returnpage' : returnpage,
        'pageNum' : pageNum,
        'Gtotal' : Gtotal,
        'GGtotal' : GGtotal,
        'pageCount' : pageCount,
      }
    )

def board_detail(request):
    
    
    try:
        cursor = connection.cursor()

        idx=request.GET.get('idx')


        msg = f"""select * from boardbbs_hobby where hobby_idx={idx};"""

        cursor.execute(msg)

        datas = cursor.fetchall()
        dto=[]



        for row in datas:
            data={"hobby_idx":row[0],"name":row[1],"title":row[2],"content":row[3],"gender":row[4],"hobby":row[5],"img_file_name":row[6]}
            dto.append(data)

        msg_reply = f""" select @ROWNUM:=@ROWNUM+1 as rrn, r.* from boardbbs_hobbyreply r,(SELECT @ROWNUM:=0) b where hobby_idx = {idx};"""

        cursor.execute(msg_reply)

        replyDatas = cursor.fetchall()
        replyList=[]
        connection.commit()
        connection.close()

        for row in replyDatas:
            data={"rrn":round(row[0]),"rhobby_idx":row[1],"rwriter":row[2],"rmemo":row[3],"hobby_idx":row[4]}
            replyList.append(data)



    except:
        connection.rollback()
        print("에러가발생했습니다.")

    
    return render(
      request,
      'boardBBS/boardDetail.html',
      {
        'dto':dto[0],
        'replyList':replyList,
      }
    )

def board_delete(request):
    try:
        cursor = connection.cursor()

        idx=request.GET.get('idx')


        msg = f"""delete from boardbbs_hobby where hobby_idx={idx};"""

        cursor.execute(msg)
        connection.commit()
        connection.close()

    except:
        connection.rollback()
        print("에러가발생했습니다.")

    
    return redirect('boardList.do')
  

def board_edit(request):
    
    try:
        cursor = connection.cursor()
        idx=request.GET.get('idx')

        msg = f"""select * from boardbbs_hobby where hobby_idx={idx};"""
        cursor.execute(msg)

        datas = cursor.fetchall()

        dto=[]
        connection.commit()
        connection.close()

        for row in datas:
            data={"hobby_idx":row[0],"name":row[1],"title":row[2],"content":row[3],"gender":row[4],"hobby":row[5],"img_file_name":row[6]}
            dto.append(data)

    except:
        connection.rollback()
        print("에러가발생했습니다.")

    
    return render(
      request,
      'boardBBS/boardEdit.html',
      {
        'dto':dto[0],
      }
    )

@csrf_exempt
def board_edit_save(request):
    try:
        cursor = connection.cursor()

        name = request.POST.get('name')
        title = request.POST.get('title')
        content = request.POST.get('content')
        gender = request.POST.get('gender')
        hobby = request.POST.getlist('hobby')
        upload_f = request.FILES.get('upload_f')
        idx = request.POST.get('hobby_idx')

        fs = FileSystemStorage(location='media/images')
        if(upload_f!=None):
          if(os.path.splitext(upload_f.name)[-1] in '.jpg.jpeg.JPG.JPEG.bmp.BMP.png.PNG.gif.GIF'):
            fs.save(upload_f.name,upload_f)
          else:
            upload_f=None
        

        msg = f"""update boardbbs_hobby set name='{name}',title='{title}',content='{content}',
                gender='{gender}',hobby='{','.join(hobby)}',img_file_name='{upload_f}'
                where hobby_idx={idx} """

        cursor.execute(msg)

        connection.commit()
        connection.close()

    except:
        connection.rollback()
        print("에러가발생했습니다.")


    return redirect('boardList.do')

@csrf_exempt
def board_reply(request):
    try:
        cursor = connection.cursor()

        hobby_idx = request.GET.get('hobby_idx')
        rwriter= request.GET.get('rwriter')
        rmemo= request.GET.get('rmemo')

        msg = f"""insert into boardbbs_hobbyreply(rwriter,rmemo,hobby_idx) values('{rwriter}','{rmemo}',{hobby_idx})"""

        cursor.execute(msg)

        connection.commit()
        connection.close()

    except:
        connection.rollback()
        print("에러가발생했습니다.")


    return redirect(f'boardDetail.do?idx={hobby_idx}')



def board_reply_delete(request):
    try:
        cursor = connection.cursor()

        idx=request.GET.get('idx')
        Ridx=request.GET.get('Ridx')


        msg = f"""delete from boardbbs_hobbyreply where rhobby_idx={Ridx};"""
        
        cursor.execute(msg)
        connection.commit()
        connection.close()

    except:
        connection.rollback()
        print("에러가발생했습니다.")

    
    return redirect(f'boardDetail.do?idx={idx}')

@csrf_exempt
def board_reply_edit(request):
    try:
        cursor = connection.cursor()

        rhobby_idx = request.GET.get('rhobby_idx')
        hobby_idx = request.GET.get('hobby_idx')
        rwriter= request.GET.get('rwriter')
        rmemo= request.GET.get('rmemo')


        msg = f"""update boardbbs_hobbyreply set rwriter='{rwriter}', rmemo='{rmemo}' where rhobby_idx={rhobby_idx};"""
        

        cursor.execute(msg)

        connection.commit()
        connection.close()

    except:
        connection.rollback()
        print("에러가발생했습니다.")

    return redirect(f'boardDetail.do?idx={hobby_idx}')