from rest_framework import serializers
from rest_framework.reverse import reverse
from .models import Post, Comment


class CommentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Comment
        fields = '__all__'


class PostSerializer(serializers.ModelSerializer):

    comments = CommentSerializer(many=True, read_only=True)

    links = serializers.SerializerMethodField()

    def get_links(self, obj):
        request = self.context['request']

        return {
            'self': reverse('post-detail',
                            kwargs={'pk': obj.pk},
                            request=request),
            'list': reverse('post-list',
                            request=request),
            'apply': reverse('post-apply',
                             kwargs={'pk': obj.pk},
                             request=request),

        }

    class Meta:
        model = Post
        fields = '__all__'
