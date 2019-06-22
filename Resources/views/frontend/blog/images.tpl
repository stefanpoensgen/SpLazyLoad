{extends file="parent:frontend/blog/images.tpl"}

{block name='frontend_blog_images_main_image'}
    {$alt = $sArticle.title|escape}

    {if $sArticle.preview.description}
        {$alt = $sArticle.preview.description|escape}
    {/if}

    <div class="blog--detail-images block">
        <a href="{$sArticle.preview.source}"
           data-lightbox="true"
           title="{$alt}"
           class="link--blog-image">

            {if $sArticle.preview.thumbnails[1].sourceSet}
                <img data-srcset="{$sArticle.preview.thumbnails[1].sourceSet}"
                     data-src="{$sArticle.preview.thumbnails[1].source}"
                     class="lazyload blog--image panel has--border is--rounded"
                     alt="{$alt}"
                     title="{$alt|truncate:160}"/>
            {else}
                <img data-srcset="{media path=$sArticle.media[0].media.path}"
                     data-src="{media path=$sArticle.media[0].media.path}"
                     class="lazyload blog--image panel has--border is--rounded"
                     alt="{$alt}"
                     title="{$alt|truncate:160}"/>
            {/if}
        </a>
    </div>
{/block}

{block name='frontend_blog_images_thumbnails'}
    <div class="blog--detail-thumbnails block">
        {foreach $sArticle.media as $sArticleMedia}

            {$alt = $sArticle.title|escape}

            {if $sArticleMedia.description}
                {$alt = $sArticleMedia.description}
            {/if}

            {if !$sArticleMedia.preview}
                <a href="{$sArticleMedia.source}"
                   data-lightbox="true"
                   class="blog--thumbnail panel has--border is--rounded block"
                   title="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt}">

                    {if $sArticleMedia.thumbnails[0].sourceSet}
                        <img data-srcset="{$sArticleMedia.thumbnails[0].sourceSet}"
                             class="lazyload blog--thumbnail-image"
                             alt="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt}"
                             title="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt|truncate:160}" />
                    {else}
                        <img data-srcset="{media path=$sArticleMedia.media.path}"
                             class="lazyload blog--thumbnail-image"
                             alt="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt}"
                             title="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt|truncate:160}" />
                    {/if}
                </a>
            {/if}
        {/foreach}
    </div>
{/block}
