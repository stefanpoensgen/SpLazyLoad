{extends file="parent:frontend/listing/product-box/box-big-image.tpl"}

{block name='frontend_listing_box_article_image_media'}
    <span class="image--media">

        {$desc = $sArticle.articleName|escape}

        {if isset($sArticle.image.thumbnails)}

            {if $sArticle.image.description}
                {$desc = $sArticle.image.description|escape}
            {/if}

            {block name='frontend_listing_box_article_image_picture_element'}
                <picture>
                {if isset($sArticle.image.thumbnails[1].webp)}
                    <source data-srcset="{$sArticle.image.thumbnails[1].webp.sourceSet}" type="image/webp">
                {/if}
                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                     data-srcset="{$sArticle.image.thumbnails[1].sourceSet}"
                     class="lazyload"
                     loading="lazy"
                     alt="{$desc}"
                     title="{$desc|truncate:160}"/>
            </picture>
            {/block}
        {else}
            <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                 data-src="{link file='frontend/_public/src/img/no-picture.jpg'}"
                 class="lazyload"
                 loading="lazy"
                 alt="{$desc}"
                 title="{$desc|truncate:160}"/>
        {/if}
    </span>
{/block}
