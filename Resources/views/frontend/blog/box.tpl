{extends file="parent:frontend/blog/box.tpl"}

{block name='frontend_blog_col_article_picture'}
    {if $sArticle.media}
        <div class="blog--box-picture">
            <a href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
               class="blog--picture-main"
               title="{$sArticle.title|escape}">
                {if isset($sArticle.media.thumbnails)}
                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                         data-srcset="{$sArticle.media.thumbnails[0].sourceSet}"
                         class="lazyload"
                         loading="lazy"
                         alt="{$sArticle.title|escape}"
                         title="{$sArticle.title|escape|truncate:160}" />
                {else}
                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                         data-src="{media path=$sArticle.media[0].media.path}"
                         class="lazyload"
                         loading="lazy"
                         alt="{$sArticle.title|escape}"
                         title="{$sArticle.title|escape|truncate:160}" />
                {/if}
            </a>
        </div>
    {/if}
{/block}
