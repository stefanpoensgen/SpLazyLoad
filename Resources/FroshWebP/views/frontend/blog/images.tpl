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

            <picture>
                {if isset($sArticle.preview.thumbnails[1].webp)}
                    <source data-srcset="{$sArticle.preview.thumbnails[1].webp.sourceSet}" type="image/webp">
                {/if}
                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                     data-srcset="{$sArticle.preview.thumbnails[1].sourceSet}"
                     data-src="{$sArticle.preview.thumbnails[1].source}"
                     class="lazyload blog--image panel has--border is--rounded"
                     loading="lazy"
                     alt="{$alt}"
                     title="{$alt|truncate:160}"
                     itemprop="image" />
            </picture>
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

                    <picture>
                        {if isset($sArticleMedia.thumbnails[0].webp)}
                            <source data-srcset="{$sArticleMedia.thumbnails[0].webp.sourceSet}" type="image/webp">
                        {/if}
                        <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                             data-srcset="{$sArticleMedia.thumbnails[0].sourceSet}"
                             class="lazyload blog--thumbnail-image"
                             loading="lazy"
                             alt="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt}"
                             title="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt|truncate:160}" />
                    </picture>
                </a>
            {/if}
        {/foreach}
    </div>
{/block}
