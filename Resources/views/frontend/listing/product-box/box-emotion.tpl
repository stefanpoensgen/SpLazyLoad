{extends file="parent:frontend/listing/product-box/box-emotion.tpl"}

{block name='frontend_listing_box_article_image_picture'}

    {$desc = $productName|escape}

    {if $sArticle.image.description}
        {$desc = $sArticle.image.description|escape}
    {/if}

    {if $sArticle.image.thumbnails}

        {if $element.viewports && !$fixedImageSize}
            {foreach $element.viewports as $viewport}
                {$cols = ($viewport.endCol - $viewport.startCol) + 1}
                {$elementSize = $cols * $cellWidth}
                {$size = "{$elementSize}vw"}

                {if $breakpoints[$viewport.alias]}

                    {if $viewport.alias === 'xl' && !$emotionFullscreen}
                        {$size = "calc({$elementSize / 100} * {$baseWidth}px)"}
                        {$size = "(min-width: {$baseWidth}px) {$size}"}
                    {else}
                        {$size = "(min-width: {$breakpoints[$viewport.alias]}) {$size}"}
                    {/if}
                {/if}

                {$itemSize = "{$size}{if $itemSize}, {$itemSize}{/if}"}
            {/foreach}
        {else}
            {$itemSize = "200px"}
        {/if}

        {$srcSet = ''}
        {$srcSetRetina = ''}

        {foreach $sArticle.image.thumbnails as $image}
            {$srcSet = "{if $srcSet}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

            {if $image.retinaSource}
                {$srcSetRetina = "{if $srcSetRetina}{$srcSetRetina}, {/if}{$image.retinaSource} {$image.maxWidth * 2}w"}
            {/if}
        {/foreach}

        <picture>
            <source sizes="{$itemSize}" data-srcset="{$srcSetRetina}" media="(min-resolution: 192dpi)" />
            <source sizes="{$itemSize}" data-srcset="{$srcSet}" />

            <img data-src="{$sArticle.image.thumbnails[0].source}" class="lazyload" loading="lazy" alt="{$desc|strip_tags|truncate:160}" />
        </picture>

    {elseif $sArticle.image.source}
        <img data-src="{$sArticle.image.source}" class="lazyload" alt="{$desc|strip_tags|truncate:160}" />
    {else}
        <img data-src="{link file='frontend/_public/src/img/no-picture.jpg'}" class="lazyload" loading="lazy" alt="{$desc|strip_tags|truncate:160}" />
    {/if}
{/block}
