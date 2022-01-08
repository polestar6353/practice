# Generated by Django 3.2.6 on 2021-12-23 14:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('boardBBS', '0004_auto_20211222_2230'),
    ]

    operations = [
        migrations.CreateModel(
            name='HobbyReply',
            fields=[
                ('rhobby_idx', models.AutoField(primary_key=True, serialize=False)),
                ('rwriter', models.CharField(max_length=20)),
                ('rmemo', models.CharField(max_length=30)),
                ('hobby_idx', models.ForeignKey(db_column='hobby_idx', on_delete=django.db.models.deletion.CASCADE, to='boardBBS.hobby')),
            ],
        ),
    ]