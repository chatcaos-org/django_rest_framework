from django.db import models


class Post(models.Model):
    name = models.CharField(max_length=25, verbose_name='Name')
    summary = models.CharField(max_length=500, verbose_name='Summary')
    content = models.TextField(max_length=1000, verbose_name='Content')
    date_created = models.DateField(verbose_name='Created Date')


class Comment(models.Model):
    post = models.ForeignKey(Post, related_name='comments')
    user_name = models.CharField(max_length=25, verbose_name='User Name')
    commment = models.CharField(max_length=250, verbose_name='Comment')
    date_created = models.DateField(verbose_name='Created Date')

