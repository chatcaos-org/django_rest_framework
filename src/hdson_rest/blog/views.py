from rest_framework import viewsets, status
from rest_framework.decorators import detail_route
from rest_framework.response import Response
from .models import Post, Comment
from .serializers import PostSerializer, CommentSerializer
from .filters import PostFilterSet


class PostViewSet(viewsets.ModelViewSet):

    queryset = Post.objects.all()
    serializer_class = PostSerializer
    filter_class = PostFilterSet


    @detail_route(methods=['post'])
    def apply(self, request, pk=None):
        return Response('OK', status=status.HTTP_200_OK)


class CommentViewSet(viewsets.ModelViewSet):

    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
