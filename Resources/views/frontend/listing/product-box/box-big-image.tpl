{extends file="parent:frontend/listing/product-box/box-big-image.tpl"}

{block name='frontend_listing_box_article_image_media'}
    <span class="image--media">

        {$desc = $sArticle.articleName|escape}

        {if isset($sArticle.image.thumbnails)}

            {if $sArticle.image.description}
                {$desc = $sArticle.image.description|escape}
            {/if}

            {block name='frontend_listing_box_article_image_picture_element'}
                <img data-srcset="{$sArticle.image.thumbnails[1].sourceSet}"
                     class="lazyload"
                     alt="{$desc}"
                     title="{$desc|truncate:160}"/>
            {/block}
        {else}
            <img data-src="{link file='frontend/_public/src/img/no-picture.jpg'}"
                 class="lazyload"
                 alt="{$desc}"
                 title="{$desc|truncate:160}"/>
        {/if}
    </span>
{/block}
