from rest_framework_filters import FilterSet
from .models import Post


class PostFilterSet(FilterSet):
    class Meta:
        model = Post
        fields = {
            'name': ['exact']
        }
