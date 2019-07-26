{extends file="parent:frontend/blog/box.tpl"}

{block name='frontend_blog_col_article_picture'}
    {if $sArticle.media}
        <div class="blog--box-picture">
            <a href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
               class="blog--picture-main"
               title="{$sArticle.title|escape}">
                {if isset($sArticle.media.thumbnails)}
                    <picture>
                        {if isset($sArticle.media.thumbnails[0].webp)}
                            <source data-srcset="{$sArticle.media.thumbnails[0].webp.sourceSet}" type="image/webp">
                        {/if}
                        <img data-srcset="{$sArticle.media.thumbnails[0].sourceSet}"
                             class="lazyload"
                             loading="lazy"
                             alt="{$sArticle.title|escape}"
                             title="{$sArticle.title|escape|truncate:160}" />
                    </picture>
                {else}
                    <img data-src="{link file='frontend/_public/src/img/no-picture.jpg'}"
                         class="lazyload"
                         loading="lazy"
                         alt="{$sArticle.title|escape}"
                         title="{$sArticle.title|escape|truncate:160}" />
                {/if}
            </a>
        </div>
    {/if}
{/block}
