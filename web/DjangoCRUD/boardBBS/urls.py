from django.urls import path
from . import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns= [
	path('boardWrite.do', views.write),
  path('boardInsert.do', views.board_insert),
  path('boardList.do', views.board_list),
  path('boardDetail.do', views.board_detail),
  path('boardDelete.do', views.board_delete),
  path('boardEdit.do', views.board_edit),
  path('boardEditSave.do', views.board_edit_save),
  path('', views.index),
  path('boardreply.do', views.board_reply),
  path('boardreply_delete.do', views.board_reply_delete),
  path('boardreply_edit.do', views.board_reply_edit, name="board_reply_edit"),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)