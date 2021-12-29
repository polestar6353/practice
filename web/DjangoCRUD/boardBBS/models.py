from os import name
from django.db import models
from django.db.models.fields import GenericIPAddressField

# Create your models here.
class Hobby(models.Model):
  hobby_idx = models.AutoField(primary_key=True)
  name = models.CharField(max_length=20)
  title = models.CharField(max_length=20)
  content = models.CharField(max_length=30)
  gender = models.CharField(max_length=20)
  hobby = models.CharField(max_length=40)
  img_file_name = models.ImageField(blank=True)

class HobbyReply(models.Model):
  rhobby_idx = models.AutoField(primary_key=True)
  rwriter = models.CharField(max_length=20)
  rmemo = models.CharField(max_length=30)
  hobby_idx=models.ForeignKey(Hobby, on_delete=models.CASCADE, db_column='hobby_idx')