<?php

namespace Mash2\Cobby\Model;


class Debug implements \Mash2\Cobby\Api\DebugInterface
{
    /**
     * @var \Magento\Store\Model\StoreManagerInterface
     */
    protected $storeManager;

    /**
     * @var \Magento\Catalog\Model\ResourceModel\Product\CollectionFactory
     */
    protected $productCollectionFactory;

    /**
     * Debug constructor.
     * @param \Magento\Store\Model\StoreManagerInterface $storeManager
     * @param \Magento\Catalog\Model\ResourceModel\Product\CollectionFactory $productCollectionFactory
     */
    public function __construct(
        \Magento\Store\Model\StoreManagerInterface $storeManager,
        \Magento\Catalog\Model\ResourceModel\Product\CollectionFactory $productCollectionFactory
    ){
        $this->storeManager = $storeManager;
        $this->productCollectionFactory = $productCollectionFactory;
    }

    public function export()
    {
        $result = array();

        $collection = $this->productCollectionFactory->create();

        foreach ($this->storeManager->getStores(true) as $store) {
            $productCountAll = $collection
                ->addStoreFilter($store->getId())
                ->getSize();

            $result[] = array(
                "store_id" => $store->getId(),
                "store_name" => $store->getName(),
                "store_code" => $store->getCode(),
                "website_id" => $store->getWebsite()->getId(),
                "website_name" => $store->getWebsite()->getName(),
                "product_count_all" => $productCountAll);
        }

        return $result;
    }
}