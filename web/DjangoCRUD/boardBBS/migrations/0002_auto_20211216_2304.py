# Generated by Django 3.2.6 on 2021-12-16 14:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('boardBBS', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='hobby',
            name='content',
            field=models.CharField(default=1, max_length=30),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='hobby',
            name='title',
            field=models.CharField(max_length=20),
        ),
    ]