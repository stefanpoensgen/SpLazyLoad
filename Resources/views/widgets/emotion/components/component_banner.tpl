{extends file="parent:widgets/emotion/components/component_banner.tpl"}

{block name="widget_emotion_component_banner_image"}

    {if $Data.thumbnails}
        {$baseSource = $Data.thumbnails[0].source}
        {$retinaBaseSource = $Data.thumbnails[0].retinaSource}

        {foreach $element.viewports as $viewport}
            {$cols = ($viewport.endCol - $viewport.startCol) + 1}
            {$elementSize = $cols * $cellWidth}
            {$size = "{$elementSize}vw"}

            {if $breakpoints[$viewport.alias]}

                {if $viewport.alias === 'xl' && !$emotionFullscreen}
                    {$size = "calc({$elementSize / 100} * {$baseWidth}px)"}
                {/if}

                {$size = "(min-width: {$breakpoints[$viewport.alias]}) {$size}"}
            {/if}

            {$itemSize = "{$size}{if $itemSize}, {$itemSize}{/if}"}
        {/foreach}

        {foreach $Data.thumbnails as $image}
            {$srcSet = "{if $srcSet}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

            {if $image.retinaSource}
                {$retinaSrcSet = "{if $retinaSrcSet}{$retinaSrcSet}, {/if}{$image.retinaSource} {$image.maxWidth}w"}
            {/if}
        {/foreach}
    {else}
        {$baseSource = $Data.source}
    {/if}

    <picture class="banner--image">
        <source sizes="{$itemSize}" data-srcset="{$retinaSrcSet}" media="(min-resolution: 192dpi), (-webkit-min-device-pixel-ratio: 2)">
        <source sizes="{$itemSize}" data-srcset="{$srcSet}">

        {* Fallback *}
        <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$baseSource}" {if $retinaBaseSource}srcset="{$retinaBaseSource} 2x"{/if} class="lazyload banner--image-src"{if $Data.title} alt="{$Data.title|escape}"{/if} />
    </picture>
{/block}
